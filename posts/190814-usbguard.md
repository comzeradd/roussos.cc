title: Blocking untrusted USB devices
date: 2019-08-14 13:57:00
slug: usbguard
tags: opensource, security
files: badusb.jpg
---

![badusb](badusb.jpg)

For fun and [security](https://www.wired.com/2014/07/usb-security/) (and a bit of [paranoia](https://web.archive.org/web/20170618122633/https://www.electronicproducts.com/Hardware/Computers/What_is_a_mouse_jiggler_and_why_does_the_FBI_use_it_when_seizing_computers.aspx)), I thought I should whitelist my trusted USB devices and block everything else.

### USBGuard

We have a couple of tools that can help us with that. [USBGuard](https://usbguard.github.io/) is the one I found to be the most configurable and well documented.

> **NOTICE**: All commands here require certain privileges. To make commands easier to read, I omitted adding `sudo` in the beginning. But you probably need to.

### Installation

USBGuard should already be packaged for your favorite Linux distribution.

One important thing to consider though is that on Debian (and derivatives) installing a package that comes with a systemd service file ends up being started and enabled by default. That means that if your input devices are USB-connected, you will find yourself locked out of your system. This may include even devices that are not physically plugged in a USB port (eg. your laptop built-in keyboard).

The upstream developer actually has a relevant warning:

> **WARNING:** before you start using usbguard be sure to configure it first unless you know exactly what you are doing (all USB devices will get blocked).

But that didn't stop the Debian developers, who maintain that package, to allow USBGuard daemon to start with zero configuration 🤷

### Systemd

You can find more [detailed guides](https://major.io/2016/05/05/preventing-ubuntu-16-04-starting-daemons-package-installed/) on how to prevent this "feature", but for the scope of this post here is what I did.

Systemd comes with a mask feature, that will prevent a certain service from being started. So for instance, if you try this:

    sudo systemctl mask nginx.service
    sudo systemctl start nginx.service

You'll get this error:

    Failed to start nginx.service: Unit nginx.service is masked.

In our case, we can't use the mask command because USBGuard is not installed yet. But what mask actually does is just create a symlink. So all we have to do is create it manually:

    sudo ln -s /dev/null /etc/systemd/system/usbguard.service

And now we can safely install USBGuard:

    sudo apt install usbguard

### Configuration

First thing to do is create an initial policy that whitelists all of our usb devices. Now it's a good time to plug-in devices that you tend to use often and you already trust. You can of course whitelist devices at any point.

    usbguard generate-policy

The above command will display the list of your currently plugged devices with an `allow` keyword in the beginning. Let's save that to USBGuard's configuration file:

    usbguard generate-policy > /etc/usbguard/rules.conf

Now it's safe to unmask, start and enable USBGuard daemon:

    systemctl unmask usbguard.service
    systemctl start usbguard.service
    systemctl enable usbguard.service


### Testing

To test this actually works try to plug a new device, not whitelisted yet. Let's a simple USB stick. Hopefully it will be blocked. To confirm that:

    usbguard list-devices

This lists all your detected devices. The new device you just plugged-in should have a `block` keyword in the beginning. For a more filtered output:

    usbguard list-devices | grep block

You should see something like this:

    13: block id 0xxx:0xxx serial <...>

### Allowing devices

Now let's say you actually want to unblock this device, because it came from a friend you trust. The command we run above also contained an ID number. The first thing on that line. We can use that and allow that device:

    usbguard allow-device 13

### Whitelisting devices

Using `allow-device` doesn't whitelist the device for ever. So let's say you bought a new external disk and you want to whitelist it. USBGuard has an `append-rule` command. You just need to paste the whole device line starting with an `allow` keyword.

Plug the device and see the USBGuard output:

    usbguard list-devices | grep block

You should see something like this:

    21: block id 0xxx:0xxx serial <...>

Copy the whole line starting from `id` and then use it *but* prefix it with an `allow` keyword (mind the single quotes used to wrap the entire rule):

    usbguard append-rule 'allow id 0xxx:0xxx serial <...>'

### Editing rules

At any point you can see the whitelisted devices:

    usbguard list-rules

And you use the id number in the beginning of each line in order to interact with that specific rule. For example to remove a device:

    usbguard remove-rule <id>

And remember, there is no such thing as [absolute security](https://xkcd.com/538/). It all comes down to your [Threat model](https://ssd.eff.org/en/glossary/threat-model).

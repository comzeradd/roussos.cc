title: Vim as a password manager
date: 2009-07-12 14:21:16
slug: vim-as-a-password-manager
post_type: post
tags: opensource, hack
---

this is a small post for the technique i 'm currently using to save my passwords, implemented on vim. i added these two lines at my ~/.vimrc file:

    map <F12> <Esc>:%!gpg --decrypt 2>/dev/null<CR><CR><C-l>
    map <S-F12> <Esc>:%!gpg --encrypt --armor --recipient mymail@mail.com<CR><CR><C-l>

these settings map two shortcuts (f12 and shift+f12) that encrypt and decrypt a plain text file respectively using gpg. it is importand to note that the file is  stored on disk only in the encrypted state. so the decrypted state of the file never touches the disk (paranoid exception: there is always the possibility that the memory space holding the file is on swap). so no special password manager software needed. no extra master passphrase. just my gpg one.

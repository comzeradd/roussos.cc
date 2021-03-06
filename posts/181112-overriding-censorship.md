title: Παρακάμπτοντας τη λογοκρισία
date: 2018-11-12 11:21:37
slug: overriding-censorship
tags: opensource, digitalrights, greek, political
files: doh-firefox.jpg, free-speech-conditions.jpg, router-dns.jpg, edppi-priceing.jpg, tor-browser.jpg, os-dns.jpg
---

![free speech conditions](free-speech-conditions.jpg)

Το παρόν κείμενο είναι μια απόπειρα καταγραφής τεχνικών μεθόδων και εργαλείων παράκαμψης της λογοκρισίας που επιβάλλεται από διάφορες κρατικές επιτροπές και τις οποίες υποχρεώνονται να εφαρμόσουν οι ελληνικοί πάροχοι internet. Πριν από περίπου δύο χρόνια [έγραψα ένα post](https://roussos.cc/2016/01/18/intellectual-property-skotadismos/) για τον κίνδυνο να δημιουργηθεί μια **επιτροπή λογοκρισίας** στο όνομα της προάσπισης δικαιωμάτων πνευματική ιδιοκτησίας. Αυτό που τόνιζα τότε:

> Αυτό που περιγράφει ο νόμος είναι τη σύσταση μια επιτροπής με την απόλυτη εξουσία και χωρίς να έχει προηγηθεί καμία δικαστική απόφαση να διατάσσει τους παρόχους να μπλοκάρουν ένα website από το ελληνικό internet.

Από τότε μέχρι σήμερα αυτό που μεσολάβησε είναι πως ο νόμος τελικά ψηφίστηκε με ελάχιστες τροποποιήσεις στα επίμαχα σημεία. Και οι όποιες τροποποιήσεις ήταν μάλλον προς το χειρότερο, καθώς η [επιτροπή](https://opi.gr/index.php/epitropi-edppi/meli-epitropis) που συστάθηκε τελικώς έχει λιγότερα μέλη και μόνο με εκπροσώπους οργανισμών (ΟΠΙ, ΕΕΤΤ, ΑΠΔΠΧ), αντί για 5μελής και με συμμετοχή δικαστικών, όπως ήταν η αρχική πρόβλεψη. Η συγκεκριμένη επιτρόπή (ΕΔΠΠΙ), πρακτικά κινείται στα χνάρια της [επιτροπής παιγνίων](https://www.gamingcommission.gov.gr/) (ΕΕΠΠ), που λειτουργεί επίσης ως επιτροπή λογοκρισίας σε ένα διαφορετικό πεδίο.

## Εμπόριο λογοκρισίας

Ένα ενδιαφέρον στοιχείο, που απ' όσο θυμάμαι, επίσης έλειπε απ' το υπό διαβούλευση νομοσχέδιο, είναι πως τα αιτήματα προς την επιτροπή κοστίζουν. Η ταρίφα είναι **372€ ανά domain**. Αλλά όπως φαίνεται και στον παρακάτω τιμοκατάλογο, κάνουν καλύτερες τιμές αν το αίτημα περιλαμβάνει περισσότερα domains.

![edppi pricing](edppi-priceing.jpg)

Μπορεί να μην συμφωνώ με τον τρόπο λειτουργίας και με την ουσία του τι κάνει αυτή η επιτροπή, αλλά έχει ενδιαφέρον πως προφανώς δεν απευθύνεται σε μεμονωμένους ανεξάρτητους καλλιτέχνες οι οποίοι πιθανόν να μην έχουν την πολυτέλεια να διαθέσουν τους σχετικούς πόρους. Τα ποσά αυτά είναι μάλλον ψίχουλα για οργανισμούς συλλογικής διαχείρισης, αλλά είναι ταυτόχρονα και απαγορευτικά για τους περισσότερους ανεξάρτητους καλλιτέχνες. Είναι αρκετά σαφές για ποιους, και από ποιους, σχεδιάστηκε να εξυπηρετήσει αυτό το νομοθέτημα.

## Αποφάσεις

Πριν από λίγες ημέρες η επιτροπή δημοσίευσε τις 3 πρώτες αποφάσεις της. Οι αποφάσεις ελήφθησαν κατόπιν αιτήματος της Εταιρίας Προστασίας Οπτικοακουστικών Έργων (Ε.Π.Ο.Ε.), που είναι οργανισμός συλλογικής προστασίας πνευματικών δικαιωμάτων, και περιλαμβάνει και μερικά γνωστά ονόματα απ' τον χώρο του κινηματογράφου (Odeon, Seven, Feelgood, Ελληνικό Κέντρο Κινηματογράφου). Η [τρίτη κατά σειρά απόφαση](https://opi.gr/images/epitropi/apofaseis/edppi_3_2018.pdf), που συγκέντρωσε και τη μεγαλύτερη δημοσιότητα παραθέτει αρκετά domain names (38) και **διατάσσει** τους παρόχους internet να διακόψουν τη πρόσβαση σε αυτούς εντός 48 ωρών.

## Τεχνική Παράκαμψη

Η αφορμή γι αυτό το κείμενο ήταν να αναφέρω συνοπτικά κάποιες απλές τεχνικές λύσεις.

Έχω [αναφέρει ξανά](https://skytal.es/blog/articles/mia-mikri-istoria-mazikis-parakolouthisis/) πως παρόλο που το ζήτημα είναι επί της ουσίας πολιτικό, αυτό δεν σημαίνει πως δεν θα αξιοποιήσουμε τα τεχνολογικά μέσα που έχουμε στη διάθεση μας παράλληλα με την όποια πολιτική δράση.

## Tor

Ο πιο απλός τρόπος να παρακάμψουμε τους μηχανισμούς μπλοκαρίσματος websites χωρίς να κάνουμε πολλές ρυθμίσεις ή αλλαγές στον υπολογιστή μας είναι να χρησιμοποιήσουμε τον [Tor Browser](https://www.torproject.org/). Είναι ένας τροποποιημένος Firefox με τον οποίο μπορούμε να περιηγηθούμε κανονικά στο διαδίκτυο, αξιοποιώντας το δίκτυο Tor. Με αυτό τον τρόπο, παρόλο που προφανώς εξακολουθούμε να χρησιμοποιούμε τμήματα της υποδομής του παρόχου μας, παρακάμπτουμε κάποια (πχ. dns) που χρησιμοποιούνται για να μπλοκάρουν συγκεκριμένο traffic.

Ως bonus, κερδίζουμε και όλα τα οφέλη της ανώνυμης περιήγησης που προσφέρει το Tor δίκτυο. Αν θες να μάθεις περισσότερα γι αυτό, κι επειδή κυκλοφορεί αρκετή παραφιλολογία στα ελληνικά media περί dark web, δες την [ομιλία του kargig](https://www.youtube.com/watch?v=7hbHKRc1nBo).

![tor browser](tor-browser.jpg)

## DNS

Δεδομένου πως οι εντολές λογοκρισίας αφορούν συγκεκριμένα domains, ο τρόπος με τον οποίο μπλοκάρονται απ' τους παρόχους είναι μέσω DNS. Χωρίς να μπλέξουμε με πολλές τεχνικές λεπτομέρειες, το DNS είναι ο τρόπος με τον οποίο ο browser ή ο υπολογιστής μας λαμβάνουν την πληροφορία για το ποια IP διεύθυνση αντιστοιχεί σε ποιο domain, ώστε να μπορέσουμε να το επισκεφτούμε.

Το router του παρόχου που έχουμε στο σπίτι μας έχει προρυθμισμένους τους DNS servers του παρόχου, οπότε βασιζόμαστε σε αυτόν να μας δώσει αυτή την πληροφορία. Είναι συνεπώς πολύ απλό να μας δώσει μια λάθος πληροφορία ώστε να μας αποτρέψει να μπούμε σε ένα website.

Ο τεχνικός τρόπος παράκαμψης είναι πολύ απλά να αλλάξουμε τους DNS servers που χρησιμοποιούμε και να επιλέξουμε κάποιους που δεν λογοκρίνουν. Και υπάρχουν πολλοί τρόποι να το κάνουμε αυτό ανάλογα με το τι μας βολεύει περισσότερο.

### Browser

Ο πιο απλός τρόπος είναι να το κάνουμε στον browser μας. Ο Firefox, απ' την τελευταία έκδοση (63) και μετά, μας δίνει τη δυνατότητα να χρησιμοποιήσουμε μια σχετικά καινούρια τεχνολογία (DNS over HTTPS), με την οποία κρυπτογραφείται το dns traffic. Επειδή είναι ακόμα υπό δοκιμή θα πρέπει να την ενεργοποιήσουμε χειροκίνητα με 4 απλά βήματα:

1. Γράφουμε στην μπάρα διεύθυνσης το παρακάτω url: `about:config`
2. Αφού πατήσουμε το κουμπί επιβεβαίωσης θα μας ανοίξει μια λίστα με όλες τις παραμέτρους ρύθμισης του Firefox. Στο πεδίο αναζήτησης γράφουμε: `trr`.
3. Βρίσκουμε την επιλογή `network.trr.mode` κάνουμε διπλό κλικ στην τιμή (που μάλλον είναι `0`) και την αλλάζουμε σε `2`.
4. Επιβεβαιώνουμε πως η επιλογή `network.trr.uri` έχει το σχετικό url από Mozilla: `https://mozilla.cloudflare-dns.com/dns-query`.

Με αυτό τον τρόπο ο Firefox θα χρησιμοποιεί την αντίστοιχη υπηρεσία της Cloudflare, αλλά μπορείς να αλλάξεις το url για να χρησιμοποιήσεις όποιον άλλο πάροχο που εμπιστεύεσαι και ξέρεις πως υποστηρίζει τη συγκεκριμένη τεχνολογία. Περισσότερα τεχνικές λεπτομέρειες στο [σχετικό blog post](https://blog.nightly.mozilla.org/2018/06/01/improving-dns-privacy-in-firefox/) από Mozilla.

![doh firefox](doh-firefox.jpg)

### Router

Μία ακόμα λύση είναι να αλλάξεις DNS servers κατευθείαν στο router σου. Τα περισσότερα καινούρια router υποστηρίζουν κάτι τέτοιο. Αυτό είναι βολικό στην περίπτωση που θέλουμε να χρησιμοποιήσουμε εναλλακτικούς DNS παρόχους σε πολλές συσκευές στο σπίτι μας.

Αν δεν έχεις μπει ποτέ στο διαχειριστικό περιβάλλον του router σου είναι μια καλή ευκαιρία να μάθεις πως να μπαίνεις και να αλλάξεις και τους default κωδικούς πρόσβασης. Για να μπεις πρέπει να γράψεις την IP διεύθυνση του router σου στον browser σου, που συνήθως είναι `192.168.1.1` ή `192.168.0.1`. Θα σου ζητήσει τα στοιχεία εισόδου. Αν δεν τα έχεις αλλάξει, θα αναγράφονται στο κάτω μέρος του router.

Αφού μπεις ψάξε για τη σχετική ρύθμιση. Συνήθως στις ρυθμίσεις LAN. Για παράδειγμα, η προκαθορισμένη επιλογή στο router μου είναι "ISP DNS" και βρίσκεται στο τμήμα "DHCP Server". Αν λοιπόν αλλάξουμε αυτή τη ρύθμιση μπορούμε να δώσουμε IP διευθύνσεις κάποιας τρίτης υπηρεσίας. Πχ. μπορούμε να χρησιμοποιήσουμε την Cloudflare (`1.1.1.1`) ή [OpenNIC](https://www.opennic.org/). Προσωπικά θα απέφευγα να χρησιμοποιήσω παρόχους που γενικώς δεν σέβονται την ιδιωτικότητα των χρηστών τους σε υπηρεσίες και προϊόντα τους, αλλά δυστυχώς είναι οι συνήθεις προτάσεις σε διάφορα forums (Google, OpenDNS). Αλλά η επιλογή είναι προσωπική, καθώς ενέχει ένα επίπεδο εμπιστοσύνης.

![router dns](router-dns.jpg)

### Λειτουργικό σύστημα

Μπορείς να αλλάξεις DNS πάροχο και σε επίπεδο λειτουργικό σύστημα. Οι ρυθμίσεις ποικίλουν ανάλογα την έκδοση και το είδος του λειτουργικού συστήματος που χρησιμοποιείς, αλλά συνήθως ο άμεσος τρόπος είναι στις ρυθμίσεις της ασύρματης ή ενσύρματης σύνδεσης που χρησιμοποιούμε.

![os dns](os-dns.jpg)

## Ελευθερία λόγου

Η ελευθερία λόγου στο διαδίκτυο είναι το ίδιο σημαντική με την ελευθερία λόγου στην offline ζωή μας. Ο "ψηφιακός κόσμος" είναι [εξίσου πραγματικός](https://medialibre.net/2017/10/24/ena-minyma-tou-george-orwell-pros-olous-sto-internet/) με τον φυσικό. **Όταν ζεις σε μια χώρα που χρησιμοποιεί μηχανισμούς λογοκρισίας στο διαδίκτυο, τότε ζεις σε μια καταπιεστική κοινωνία.** Δεν υπάρχει κάποιος διαχωρισμός ανάμεσα σε αυτά τα δύο.

Το διακύβευμα στη συγκεκριμένη περίπτωση είναι πολύ απλό. **Ποιο δικαίωμα είναι πιο σημαντικό; Η ελευθερία λόγου ή το οικονομικό συμφέρον ενός καλλιτέχνη;** Δεδομένου πως μιλάμε για επιτροπές οι οποίες αποφασίζουν χωρίς καμία δικαστική ή οποιαδήποτε άλλη λογοδοσία, μπορούμε να καταλάβουμε πως απαντάει σε αυτό το ερώτημα η πολιτική εξουσία.

Το θέμα των πνευματικών δικαιωμάτων και του βιοπορισμού των καλλιτεχνών είναι αρκετά σημαντικό, αλλά δεν πρόκειται να λυθεί με προχειρότητα και υιοθετώντας αυταρχικές μεθόδους με επιτροπές που λειτουργούν πέρα από οποιαδήποτε διαδικασία ερμηνείας και επιβολής του νόμου. Μέθοδοι, που όπως φαίνεται κι απ' τα παραπάνω, δεν έχουν καν την απαιτούμενη αποτελεσματικότητα.

Μάθε πως μπορείς να χρησιμοποιήσεις την τεχνολογία για να παρακάμψεις τη λογοκρισία ή/και να διατηρήσεις την ανωνυμία σου. Γίνονται συχνά συναντήσεις και [workshops](https://www.cryptoparty.in/athens) γύρω απ' αυτά τα θέματα. Αν συμμετέχεις σε κάποια κοινότητα ή οργανισμό θα χαρούμε να οργανώσουμε κι εκεί κάποιο workshop.

## Τεχνικό παράρτημα

Το μπλοκάρισμα των sites που αναφέρονται στην απόφαση έχει ήδη ξεκινήσει. Άλλωστε είχαν μόνο 48 ώρες για να συμμορφωθούν οι πάροχοι.

Ως παράδειγμα ένας dns server της Cosmote:

    dig +short @195.170.0.1 gamatotv.me
    83.235.64.18

Αν αναρωτιέσαι τι είναι αυτή η IP που επιστρέφει:

    dig +short -x 83.235.64.18
    edppi.otenet.gr.

Οπότε η επιτροπή έχει και την τεχνική δυνατότητα αν το επιθυμεί να καταγράφει τις IP διευθύνσεις των χρηστών που προσπαθούν να μπουν στα συγκεκριμένα websites.

Ας δοκιμάσουμε να ρωτήσουμε την Cloudflare:

    dig +short @1.1.1.1 gamatotv.me
    104.27.172.177
    104.27.173.177

<hr>

*Comments and reactions on [Mastodon](https://libretooth.gr/@comzeradd/101057372755768712), [Diaspora](https://librenet.gr/posts/2113817), [Twitter](https://twitter.com/comzeradd/status/1061905669828288513).

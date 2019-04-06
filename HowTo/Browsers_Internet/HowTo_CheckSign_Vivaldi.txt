HowTos: vivaldi browser hacking tips and tasks
Kanotix Guide
Thu Feb 21 16:07:16 EST 2019
---------------------------------------------

source: https://help.vivaldi.com/article/obtaining-official-builds/

To verify vivaldi .deb signature verify procedure.


Debian/Ubuntu

Open a terminal window and issue the following to fetch a copy of our public key, securely over https:

wget https://repo.vivaldi.com/stable/linux_signing_key.pub

Import the key into the GPG keyring of your local user:

gpg --import linux_signing_key.pub

You can now verify that the signature is valid, like so (adjust the file name to account for the current version and architecture):

dpkg-sig --verify vivaldi-stable_2.1.1337.51-1_amd64.deb

If everything is ok, it should return a result that includes “GOODSIG” and a 41 character, key ID that should end with “EFB20B23”—Older packages are signed with “C3401E12”.
-----

Thu Feb 21 16:11:54 EST 2019
For: vivaldi-stable_2.3.1440.48-1_amd64.deb:
GOODSIG _gpgbuilder 68AEAE71F9FA158703C1CBBC8D04CE49EFB20B23 1550180042

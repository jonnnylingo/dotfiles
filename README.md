# New mac setup
---
This repo contains all the scripts I use to set up a new Mac, and to keep my dotfiles in sync across my computers. I use [chezmoi](https://www.chezmoi.io/) to manage the dotfiles. 

> It was forked from https://github.com/monfresh/dotfiles.  

> Read his [step-by-step detailed guide](https://www.moncefbelyamani.com/automating-the-setup-of-a-new-mac-with-all-your-apps-preferences-and-development-tools/).
---

## Preperation on Old Mac:
Copy all your ".something" files into the corresponding "dot_something" file in this repo.

### Deactivate licenses/Sign out
- Capto
- 4kDownload
- Bartender
- Apple TV, Music
- Others?

### Create Brewfile:

1. Run:
	```shell
	cd ~
	brew bundle dump
	```
2. Then copy contents into Brewfile.tmpl in this repo.


## Set up new Mac

1. Sign in to iCloud and App Store, otherwise installing apps via [mas](https://github.com/mas-cli/mas) won’t work.

2. Download and execute `.laptop.local`:
	```shell
	cd ~; curl --remote-name https://raw.githubusercontent.com/jonnnylingo/dotfiles/main/dot_laptop.local; mv dot_laptop.local .laptop.local; chmod 744 .laptop.local;./.laptop.local
	```

	When prompted by chezmoi for email, enter the email you want to use for Git.
	When prompted for location, enter `home` or `work`, so that the appropriate apps
	and aliases are installed based on whether this is a home computer or work computer.
	See [Brewfile.local.tmpl](https://github.com/monfresh/dotfiles/blob/master/Brewfile.local.tmpl) for an example.
	When prompted for the various tokens, get them from 1Password and paste them in.

3. Restart the computer.

---
# Maintenance
If you want to refresh dot files on your current Mac, just run:
```shell
curl -O https://raw.githubusercontent.com/jonnnylingo/dotfiles/main/dot_backup_dotfiles.sh; sudo chmod +x dot_backup_dotfiles.sh; ./dot_backup_dotfiles.sh
```
This will download the dot_backup_dotfiles.sh script, make it executable, and run it.  The script will take all your ~/.* files and copy them to a .dot_backkup file so you can refresh all your dot files from the repo.  

---
### Other Resources
Look-up Homebrew Formlae: [https://formulae.brew.sh/cask/](https://formulae.brew.sh/cask/)

The Unofficial guide to dotfiles on GitHub: [https://dotfiles.github.io/](https://dotfiles.github.io/)


### To Remove current dot files to run .laptop.local from github again
```shell
rm .aliases;rm .b*;sudo rm -r .config;rm .curlrc;rm .e*;rm .functions;rm .g*;rm .hushlogin;rm .inputrc;rm .laptop.local;sudo rm -r .local;rm .macos;rm .nvm;rm .screenrc;rm .wgetrc;sudo rm -r .zsh_sessions;rm .z*;
```

### To archive current dot files to a new folder named dot_archive
```shell
mkdir dot_archive;mv .aliases dot_archive; mv .b* dot_archive; mv .config dot_archive; mv .curlrc dot_archive; mv .e* dot_archive; mv .functions dot_archive; mv .g* dot_archive; mv .hushlogin dot_archive; mv .inputrc dot_archive; mv .laptop.local dot_archive; mv .local dot_archive; mv .macos dot_archive; mv .nvm dot_archive; mv .screenrc dot_archive; mv .wgetrc dot_archive; mv .zsh_sessions dot_archive; mv .z* dot_archive;
```

---
TODO: 
- [ ] Automatically set macOs settings using the executable_dot_macos file.
- [ ] Set spotlight to opt + spacebar to make space for Alfred

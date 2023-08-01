# jonnnylingo new mac setup

This repo contains all the scripts I use to set up a new Mac, and to keep my dotfiles in sync across my computers. I use [chezmoi](https://www.chezmoi.io/) to manage the dotfiles. It was forked from https://github.com/monfresh/dotfiles.  Read his [step-by-step detailed guide](https://www.moncefbelyamani.com/automating-the-setup-of-a-new-mac-with-all-your-apps-preferences-and-development-tools/).


### OLD MAC: Deactivate licenses/Sign out
- Capto
- 4kDownload
- Bartender
- Apple TV, Music
- Others?

To Create Brewfile:
```shell
brew bundle dump
```
Then copy contents into Brewfile.tmpl


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


### Other Resources
Look-up Homebrew Formlae: [https://formulae.brew.sh/cask/](https://formulae.brew.sh/cask/)

The Unofficial guide to dotfiles on GitHub: [https://dotfiles.github.io/](https://dotfiles.github.io/)


### To Remove current dot files to run .laptop.local from github again
```shell
rm .aliases;rm .b*;sudo rm -r .config;rm .curlrc;rm .e*;rm .functions;rm .g*;rm .hushlogin;rm .inputrc;rm .laptop.local;sudo rm -r .local;rm .macos;rm .nvm;rm .screenrc;rm .wgetrc;sudo rm -r .zsh_sessions;rm .z*;
```

---
TODO: Automatically set macOs settings using the executable_dot_macos file.

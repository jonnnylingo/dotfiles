# jonnnylingo new mac setup

This repo contains all the scripts I use to set up a new Mac, and to keep my dotfiles in sync across my computers. I use [chezmoi](https://www.chezmoi.io/) to manage the dotfiles. It was forked from https://github.com/monfresh/dotfiles.  Read his [step-by-step detailed guide](https://www.moncefbelyamani.com/automating-the-setup-of-a-new-mac-with-all-your-apps-preferences-and-development-tools/).


### OLD MAC: Deactivate licenses/Sign out
- Capto
- 4kDownload
- Bartender
- Apple TV, Music
- Others?

## Set up new Mac

1. Sign in to iCloud and App Store, otherwise installing apps via [mas](https://github.com/mas-cli/mas) won’t work.

2. Download `.laptop.local`:
```shell
cd ~; curl --remote-name https://raw.githubusercontent.com/jonnnylingo/dotfiles/main/dot_laptop.local; mv dot_laptop.local .laptop.local; chmod 744 .laptop.local;./.laptop.local
```

When prompted by chezmoi for email, enter the email you want to use for Git.
When prompted for location, enter `home` or `work`, so that the appropriate apps
and aliases are installed based on whether this is a home computer or work computer.
See [Brewfile.local.tmpl](https://github.com/monfresh/dotfiles/blob/master/Brewfile.local.tmpl) for an example.
When prompted for the various tokens, get them from 1Password and paste them in.

3. Restart the computer.

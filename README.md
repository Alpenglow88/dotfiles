
> This is a shell script to set up a macOS laptop for  development.

It can be run multiple times on the same machine safely. It installs, upgrades, or skips packages based on what is already installed on the machine.

## Install

Download the script:

```sh
git clone git@github.com:Alpenglow88/dotfiles.git && cd dotfiles
```

Review the script (please don't run scripts you don't understand):

```sh
nano install
```

install:

```sh
cd dotfiles
./install.sh 2>&1 | tee ~/install.log
```
Just follow the prompts and you’ll be fine. 👌

:warning: Warning: I advise against running [this script](install) unless you understand what it’s doing to your computer.

I created this based on my own preferences; your mileage may vary.

Once the script is done, quit and relaunch Terminal.

It is highly recommended to run the script regularly to keep your computer up to date.

Your last Install run will be saved to `~/install.log`. To review it, run `less ~/install.log`.

That's it! :sparkles:

## What it sets up
The setup process will install:

<details>
<summary>Basic tools:</summary>

* [XCode Command Line Tools](https://developer.apple.com/xcode/downloads/) for developer essentials.
* [Bash-it](https://github.com/Bash-it/bash-it/), for a more powerful bash.
* [Git](https://git-scm.com/) for version control
* [Homebrew](http://brew.sh/) for managing operating system libraries.
</details>

<details>
<summary>Package Managers:</summary>

* [NVM](https://github.com/creationix/nvm/) for managing and installing multiple versions of [Node.js](http://nodejs.org/) and [npm](https://www.npmjs.org/)
* [RMV](https://rvm.io/) for managing versions of Ruby
</details>

<details>
<summary>CLI Tools & Utilities:</summary>

* [asciinema](https://asciinema.org/) for recording terminal sessions
* [Hub](http://hub.github.com/) for interacting with the GitHub API
* [mas](https://github.com/mas-cli/mas) Mac App Store command line interface
* [Tig](https://github.com/jonas/tig) text-mode interface for git
* [Vagrant](https://www.vagrantup.com/) for development environments
</details>

### Apps

<details>
<summary>Development</summary>

* [iTerm](https://www.iterm2.com/) for a better terminal.
* [Virtual Box](https://www.virtualbox.org/) powerful virtualization tool
* [Visual Studio Code](https://code.visualstudio.com/) IDE
</details>


<details>
<summary>Utilities</summary>

* [Dropbox](https://www.dropbox.com) for cloud file storage.

</details>

<details>
<summary>Miscellaneous</summary>

* [Spotify](https://www.spotify.com/) for music.
* [VLC](http://www.videolan.org/) for a better media player.
</details>

<details>
<summary>Browsers</summary>

* [Chrome](https://www.google.com/chrome/browser/desktop/) for fast and free web browsing.
* [Firefox](https://www.mozilla.org/en-US/firefox/new/) for web browsing and testing.
</details>

<sub>See [`swag`](swag) for the full list of apps that will be installed. Adjust it to your personal taste.</sub>

It should take less than 20 minutes to install (depends on your machine).

##  Just add `~/.customisations`

Your `~/.customisations` are added at the end of the Install script. Put your customisations there.
For example:

```sh
#!/usr/bin/env bash

SETUP_ROOT=$HOME/.setup

NERDFONTS_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/ryanoasis/nerd-fonts/releases/latest)
NERDFONTS_VERSION=$(get_github_version $NERDFONTS_RELEASE)

DIRECTORIES=(
    $HOME/Desktop/code
    $HOME/Desktop/design
    $HOME/Desktop/*dump
    $HOME/Desktop/GIFs
    $HOME/Desktop/projects
    $HOME/Desktop/screenshots
)

NERDFONTS=(
    SpaceMono
    Hack
    AnonymousPro
    Inconsolata
)

step "Making directories…"
for dir in ${DIRECTORIES[@]}; do
    mkd $dir
done

step "Installing fonts…"
for font in ${NERDFONTS[@]}; do
    if [ ! -d ~/Library/Fonts/$font ]; then
        printf "${indent}  [↓] $font "
        wget -P ~/Library/Fonts https://github.com/ryanoasis/nerd-fonts/releases/download/$NERDFONTS_VERSION/$font.zip --quiet;unzip -q ~/Library/Fonts/$font -d ~/Library/Fonts/$font
        print_in_green "${bold}✓ done!${normal}\n"
    else
        print_muted "${indent}✓ $font already installed. Skipped."
    fi
done
```

Write your customisations such that they can be run safely more than once.
See the `install` script for examples.

Install functions such as `step` and `link` can be used in your `~/.customizations`.

## Known Issues
Cask does not recognize applications installed outside of Homebrew Cask – in the case that the script fails, you can either remove the application from the install list or uninstall the application causing the failure and try again.

## Acknowledgements

Inspiration and code was taken from many sources, including:

* [Mina Markham's](https://github.com/minamarkham) [Install](https://install.sh/)
* [Mathias Bynens'](https://github.com/mathiasbynens) [dotfiles](https://github.com/mathiasbynens/dotfiles)
* thoughtbot's [laptop](https://github.com/thoughtbot/laptop/)


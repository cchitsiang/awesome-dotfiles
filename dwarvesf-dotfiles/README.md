# Dotfiles

- [Automate your development enviroment](#automate-your-development-environment)
- [What will be installed in this dotfile](#what-will-be-installed-in-this-dotfile)
- [How the dotfiles command works](#how-the-dotfiles-command-works)
- [Installation](#installation)

## Share configuration with dotfiles

In UNIX, the files start with a dot “.” are hidden. If you list files in the directory, they don’t show up and keep them safe from the end users. Because of that reason, the developer usually uses it to store configurations of their tools.

Those files are so-called dotfiles. 'Dotfile' become a generalized term for a UNIX configuration file, typically prefixed with a dot (e.g., .vimrc) and found in your home directory. Most UNIX programs, including Vim, will load a dotfile during launch.

We recommend using dotfiles to customize your tools and environment to suit your preferences, reduce typing, and get work done. Check them into a git repository for safe-keeping and open-source for the benefit of others.

## Automate your development environment

We use MacOS and Ubuntu as a environment for development. We depend on compilers, databases, programming languages, package management systems, installers, and other critical programs for our daily activities.

Using an automated setup helps us to stay up-to-date with new operating system and program versions. Also, because the setup is standardized, new team members are able to quickly join a project without wasting time re-configuring their machine.

[dotfiles]: bin/dotfiles

## What will be installed in this dotfile

Framework/Language

- Golang
- Nodejs
- Nvm
- Yarn
- Elixir
- Python

Editor

- Vim
- Vscode
- Emacs

Tools

- Docker
- ZSH (Prezto)
- Ngrok
- Tableplus
- Insomnia
- Gotiengviet
- Chrome
- Slack

## Installation

### OS X Prerequisite

You need to have [XCode](https://developer.apple.com/downloads/index.action?=xcode) or, at the very minimum, the [XCode Command Line Tools](https://developer.apple.com/downloads/index.action?=command%20line%20tools), which are available as a much smaller download.

The easiest way to install the XCode Command Line Tools in OSX 10.9+ is to open up a terminal, type `xcode-select --install` and [follow the prompts](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/).

_Tested in OSX 10.10_

### Ubuntu Prerequisite

You might want to set up your ubuntu server [like I do it](https://github.com/cowboy/dotfiles/wiki/ubuntu-setup), but then again, you might not.

Either way, you should at least update/upgrade APT with `sudo apt-get -qq update && sudo apt-get -qq dist-upgrade` first.

_Tested in Ubuntu 14.04 LTS_

#### Ubuntu

```sh
bash -c "$(wget -qO- https://bit.ly/df-dotfiles)" && source ~/.bashrc
```

#### macOS

```sh
bash -c "$(curl -fsSL https://bit.ly/df-dotfiles)" && source ~/.bashrc
```

## Aliases and Functions

To keep things easy, the `~/.bashrc` and `~/.bash_profile` files are extremely simple, and should never need to be modified. Instead, add your aliases, functions, settings, etc into one of the files in the `source` subdirectory, or add a new file. They're all automatically sourced when a new shell is opened. Take a look, I have [a lot of aliases and functions](source).

## Scripts

In addition to the aforementioned [dotfiles][dotfiles] script, there are a few other [bin scripts](bin).

- [dotfiles][dotfiles] - (re)initialize dotfiles. It might ask for your password (for `sudo`).
- [src](link/.bashrc#L8-18) - (re)source all files in `/source` directory
- Look through the [bin](bin) subdirectory for a few more.

## How the "dotfiles" command works

When [dotfiles][dotfiles] is run for the first time, it does a few things:

1. In Ubuntu, Git is installed if necessary via APT (it's already there in OSX).
1. This repo is cloned into your user directory, under `~/.dotfiles`.
1. Files in `/copy` are copied into `~/`. ([read more](#the-copy-step))
1. Files in `/link` are symlinked into `~/`. ([read more](#the-link-step))
1. You are prompted to choose scripts in `/init` to be executed. The installer attempts to only select relevant scripts, based on the detected OS and the script filename.
1. Your chosen init scripts are executed (in alphanumeric order, hence the funky names). ([read more](#the-init-step))

On subsequent runs, step 1 is skipped, step 2 just updates the already-existing repo, and step 5 remembers what you selected the last time. The other steps are the same.

### Other subdirectories

- The `/backups` directory gets created when necessary. Any files in `~/` that would have been overwritten by files in `/copy` or `/link` get backed up there.
- The `/bin` directory contains executable shell scripts (including the [dotfiles][dotfiles] script) and symlinks to executable shell scripts. This directory is added to the path.
- The `/caches` directory contains cached files, used by some scripts or functions.
- The `/conf` directory just exists. If a config file doesn't **need** to go in `~/`, reference it from the `/conf` directory.
- The `/source` directory contains files that are sourced whenever a new shell is opened (in alphanumeric order, hence the funky names).
- The `/test` directory contains unit tests for especially complicated bash functions.
- The `/vendor` directory contains third-party libraries.

### The "copy" step

Any file in the `/copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [copy/.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

### The "link" step

Any file in the `/link` subdirectory gets symlinked into `~/` with `ln -s`. Edit one or the other, and you change the file in both places. Don't link files containing sensitive data, or you might accidentally commit that data! If you're linking a directory that might contain sensitive data (like `~/.ssh`) add the sensitive files to your [.gitignore](.gitignore) file!

### The "init" step

Scripts in the `/init` subdirectory will be executed. A whole bunch of things will be installed, but _only_ if they aren't already.

#### OS X

- Minor XCode init via the [init/10_osx_xcode.sh](init/10_osx_xcode.sh) script
- Homebrew via the [init/20_osx_homebrew.sh](init/20_osx_homebrew.sh) script
- Homebrew recipes via the [init/30_osx_homebrew_recipes.sh](init/30_osx_homebrew_recipes.sh) script
- Homebrew casks via the [init/30_osx_homebrew_casks.sh](init/30_osx_homebrew_casks.sh) script
- [Fonts](/dwarvesf/dotfiles/tree/master/conf/osx/fonts) via the [init/50_osx_fonts.sh](init/50_osx_fonts.sh) script
- iTerm2 config can be configured at `Preferences > General > Preferences > Load Preferences from a custom folder or URL`

#### Ubuntu

- APT packages and git-extras via the [init/20_ubuntu_apt.sh](init/20_ubuntu_apt.sh) script

#### Both

- Node.js, npm and nvm via the [init/50_node.sh](init/50_node.sh) script
- Golang and plugins via the [init/50_golang.sh](init/50_golang.sh)
- Vim plugins via the [init/50_vim.sh](init/50_vim.sh) script
- VSCode via the [init/60_vscode.sh](init/60_vscode.sh) script

## Hacking the dotfiles

Because the [dotfiles][dotfiles] script is completely self-contained, you should be able to delete everything else from your dotfiles repo fork, and it will still work. The only thing it really cares about are the `/copy`, `/link` and `/init` subdirectories, which will be ignored if they are empty or don't exist.

## Contributing

The main purpose of this repository is to continue to evolve the way we setup development environment, making it faster and easier to use. Development happens in the open on GitHub, and we are grateful to the community for contributing bug fixes and improvements. Read below to learn how you can take part in improving it.

Read our contributing guide to learn about our development process, how to propose bugfixes and improvements, and how to build and test your changes.

## License

MIT @ [Dwarves Foundation](https://d.foundation)

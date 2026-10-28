# dotfiles

My personal bash and zsh configuration.

```
bash/.bashrc        history, git-branch prompt, ls/grep colors, nvm auto-switch (cdnvm), mise
bash/.bash_profile  sources .bashrc
bash/.profile       login shell PATH (~/bin, ~/.local/bin)
zsh/.zshrc          oh-my-zsh (dracula theme, git / autosuggestions / syntax-highlighting), mise
install.sh          symlinks the above into $HOME and installs oh-my-zsh, plugins, and themes
```

## Install

```bash
git clone https://github.com/swordfishray/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

Existing files are moved to `~/.dotfiles-backup/<timestamp>/` before being replaced with symlinks.

Machine- or work-specific settings belong in `~/.bash_aliases`, which `.bashrc` sources if present and which is not tracked here.

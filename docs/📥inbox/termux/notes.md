To install and configure AstroNvim with Nerd Fonts and the necessary tools in Termux, follow these steps:


---

1. Install Prerequisites

Run these commands in Termux to set up the required tools:

Update and install base packages:

pkg update && pkg upgrade
pkg install git neovim python nodejs ripgrep clang
pip install pynvim

Install a clipboard tool:

For Termux, install termux-api and grant permissions for clipboard access:

pkg install termux-api
termux-clipboard-set


3. Set the font in your terminal emulator settings to a Nerd Font (like JetBrainsMono Nerd Font).

prerequirments
# font
# zsh

nvim ~/.zshrc

add

```
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

```

 source ~/.zshrc
---

2. Install AstroNvim

Clone the AstroNvim repository:

git clone https://github.com/AstroNvim/AstroNvim ~/.config/astronvim

Open Neovim to let it install plugins:

nvim

change AstroNvim as astronvim

---

3. Install Tree-sitter CLI

Tree-sitter is required for advanced syntax highlighting.

Install Tree-sitter CLI:

npm install -g tree-sitter-cli


---

4. Configure Nerd Font Icons

AstroNvim uses Nerd Fonts for icons. If you notice any missing icons:

1. Edit the init.lua or relevant configuration file.


2. Replace icons with those supported by your chosen Nerd Font.




---

5. Optional Tools

Install the optional tools for additional features:

lazygit:

pkg install lazygit

bottom (Process Viewer):

pkg install bottom



---

6. Launch AstroNvim

Run Neovim to use AstroNvim:

nvim

This setup ensures AstroNvim works with Nerd Fonts and necessary features in Termux. Let me know if you need further assistance!




nvim keyboard shortcut



pkg install -y ripgrep lazygit golang python nodejs
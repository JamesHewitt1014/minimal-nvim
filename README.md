# Linux Install
Install Neovim
`curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage /opt/nvim/nvim.appimage`

Add path to ~/.bashrc
`export PATH="$PATH:/opt/nvim/"`

Download repo
`git clone https://github.com/JamesHewitt1014/simple-nvim.git ~/.config/nvim`

# Mac
- Requires homebrew
Install Neovim
`brew install neovim`

Add path to ~/.zprofile
`export PATH="$PATH:/opt/nvim/"`

Download repo
`git clone https://github.com/JamesHewitt1014/simple-nvim.git ~/.config/nvim`

# Windows
Install neovim
`winget install Neovim.Neovim`

Download repo
`git clone https://github.com/JamesHewitt1014/simple-nvim.git ~/.config/nvim`

Note: 
Windows requires the following
* `mingw` installed and set on path
* 'GnuWin32' installed and set on path

-----
Ripgrep is an optional dependency

# JuliaTutorial
A brief Julia tutorial


## Setting-up your work environment

Required software:

* Julia available from https://julialang.org/downloads/. The exercise is tested with the version 1.0 of Julia (on Linux).
* The version control tool git. Under Debian/Ubuntu this can be done by the following programs

```bash
sudo apt-get install git python3
```

* Some Julia packages, which can be installed with these commands once you started Julia:

```julia
using Pkg
Pkg.add("NCDatasets")
Pkg.add("PyPlot")
Pkg.add("IJulia")
Pkg.add("Interpolations")
Pkg.add("PyCall")
Pkg.add("Missings")
```

* Editor with julia support. For example, install emacs and the file `julia-mode.el` as follows:

```bash
mkdir ~/site-lisp
cd ~/site-lisp
wget https://raw.githubusercontent.com/JuliaEditorSupport/julia-emacs/master/julia-mode.el
wget https://raw.githubusercontent.com/JuliaEditorSupport/julia-emacs/master/julia-latexsubs.el
cat >> ~/.emacs <<EOF
;; Add a local lisp folder to your load-path
(setq load-path (append load-path (list "~/site-lisp")))
(require 'julia-mode)
(setq auto-mode-alist (append '(("\\.jl$" . julia-mode)) auto-mode-alist))

EOF
```

### Optionally

* Install a desktop launcher and icon for julia

```bash
wget -O /tmp/julia.desktop https://raw.githubusercontent.com/JuliaLang/julia/e90f29db30f81f340d4f36669b27ac5a281e2a7f/contrib/julia.desktop
desktop-file-install --dir=$HOME/.local/share/applications /tmp/julia.desktop
mkdir -p ~/.local/share/icons/hicolor/scalable/apps/
cd ~/.local/share/icons/hicolor/scalable/apps/
wget https://raw.githubusercontent.com/JuliaLang/julia/30bf89f3d8e564b588b8e48993e92a551b384f2c/contrib/julia.svg
cd ~
```



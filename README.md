[![Build Status](https://travis-ci.org/Alexander-Barth/JuliaTutorial.svg?branch=master)](https://travis-ci.org/Alexander-Barth/JuliaTutorial) [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Alexander-Barth/JuliaTutorial/master?filepath=Julia%20Tutorial%20of%20Data%20Analysis%20in%20Oceanography.ipynb)


# JuliaTutorial
A brief Julia tutorial


## Setting-up your work environment

Required software:

* Julia available from https://julialang.org/downloads/. The exercise is tested with the version 1.5 of Julia (on Linux)
* Some Julia packages, which can be installed with these commands once you started Julia:

```julia
using Pkg
Pkg.add("NCDatasets")
Pkg.add("PyPlot")
Pkg.add("IJulia")
Pkg.add("Interpolations")
Pkg.add("PyCall")
Pkg.add("Missings")
using PyPlot
using IJulia
notebook()
```



## Optional


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

* Install a desktop launcher and icon for julia

```bash
wget -O /tmp/julia.desktop https://raw.githubusercontent.com/JuliaLang/julia/e90f29db30f81f340d4f36669b27ac5a281e2a7f/contrib/julia.desktop
desktop-file-install --dir=$HOME/.local/share/applications /tmp/julia.desktop
mkdir -p ~/.local/share/icons/hicolor/scalable/apps/
cd ~/.local/share/icons/hicolor/scalable/apps/
wget https://raw.githubusercontent.com/JuliaLang/julia/30bf89f3d8e564b588b8e48993e92a551b384f2c/contrib/julia.svg
cd ~
```



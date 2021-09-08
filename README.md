[![Build Status](https://github.com/Alexander-Barth/JuliaTutorial/workflows/CI/badge.svg)](https://github.com/Alexander-Barth/JuliaTutorial/actions) [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Alexander-Barth/JuliaTutorial/master?filepath=Julia%20Tutorial%20of%20Data%20Analysis%20in%20Oceanography.ipynb)


# JuliaTutorial

This is a brief Julia tutorial for oceanographers.

These notebooks can either be used:
* on the computers in the computer room (2/25, 2nd floor of the B5A building)
* on your machine following the introductions below
* on MyBinder.org using the link [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Alexander-Barth/JuliaTutorial/master?filepath=Julia%20Tutorial%20of%20Data%20Analysis%20in%20Oceanography.ipynb) (this can take 2 to 10 minutes to start). Do not forget to download and save your notebook and results. Remember to stop the notebooks (File -> Closes and Halt) to free resources.


## Setting-up your work environment

Required software:

* Julia available from https://julialang.org/downloads/. The exercise is tested with the version 1.6 of Julia. Some additional information is available here: https://github.com/gher-ulg/Documentation/wiki/Installing-Julia
* Some Julia packages, which can be installed with these commands once you started Julia:

```julia
using Pkg
cd("/home/abarth/Lectures/JuliaTutorial")
using Pkg
Pkg.activate(".")
Pkg.instantiate()
```
where you replace `"/home/abarth/Lectures/JuliaTutorial"` by the folder where you downloaded (and extracted) the notebook files. Note on Windows you need to use the blackslash as path separator a `raw` string for example `raw"C:\Users\Name\Documents\JuliaTutorial"`.


```julia
using IJulia
notebook(dir = "/home/abarth/Lectures/JuliaTutorial")
```


## Preview the notebook files

By following the link to [nbviewer.jupyter.org](https://nbviewer.jupyter.org/github/Alexander-Barth/JuliaTutorial/tree/master/) you see a list of all notebooks. For the example the Introduction notebook is available at https://nbviewer.jupyter.org/github/Alexander-Barth/JuliaTutorial/blob/master/JuliaIntroduction.ipynb .

## Optional configuration (if using Linux)


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



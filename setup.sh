#!/bin/bash

# Note julia (version 1.6) must be in your PATH
# julia is avaliable at https://julialang.org/downloads/

# The julia version can be checked by running
# julia --version

# This script is to be run as regular users, i.e. the student (not the root user)
# It downloads the tutorial and installs all required packages.


mkdir -p ~/Downloads

# delete previous version of the tutorial
rm -R ~/Downloads/JuliaTutorial*

# dowload the tutorial
curl -L https://github.com/Alexander-Barth/JuliaTutorial/archive/refs/heads/master.zip > ~/Downloads/JuliaTutorial-master.zip

# uncompress
cd ~/Downloads
unzip JuliaTutorial-master.zip

# install all required packages
cd ~/Downloads/JuliaTutorial-master

julia <<EOF
using Pkg
Pkg.activate(".")
Pkg.instantiate()
using IJulia
using PyPlot
EOF




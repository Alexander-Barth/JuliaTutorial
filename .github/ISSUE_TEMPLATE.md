
Please provide the following information:

* Operating system and its version (e.g. Windows 10, Ubuntu 20.04)

* Copy and paste the error message text (avoid screenshots if you can; this makes searching the error message much simpler)

* Steps done so far that led to the error

* Do you have Anaconda installed? If yes, is Anaconda activated by default?

* The content of the environment variable PATH
    * for Windows see https://www.computerhope.com/issues/ch000549.htm
    * for Linux or Mac: open a terminal and type in the terminal: echo $PATH


* Only for problems with IJulia:
    * search for the file jupyter-notebook on your computer and provide the full paths found (there can be several)
    * In a Julia session, paste the following commands and provide the output that you are getting.


ENV["IJULIA_DEBUG"]=true
using Pkg
Pkg.build("IJulia",verbose=true)
using IJulia
IJulia.notebook()


Providing the information for all these points helps a lot to help a user.

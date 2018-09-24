# PSPlot.jl
A Julia wrapper for PyPlot generating EPS files that compile against PSTool in LaTeX

[![Build Status](https://travis-ci.org/reesepathak/PSPlot.jl.svg?branch=master)](https://travis-ci.org/reesepathak/PSPlot.jl)
[![Coverage Status](https://coveralls.io/repos/github/reesepathak/PSPlot.jl/badge.svg?branch=master)](https://coveralls.io/github/reesepathak/PSPlot.jl?branch=master)
[![codecov](https://codecov.io/gh/reesepathak/PSPlot.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/reesepathak/PSPlot.jl)


The goal of this package is to allow Julia users to insert plots with `pstool` (or also `psfrag') in PDFLaTeX (or also in LaTeX),
just as MATLAB users can use `psfrag`. 

# Installation

This package is best installed through the following commands
```Julia
Pkg.clone("https://github.com/reesepathak/PSPlot.jl.git")
Pkg.update()
```
We are also in the `METADATA.jl` repository, so you can add the package via `Pkg.add("PSPlot")`, but you will
get an outdated version of the code (read as: possibly having more bugs). Please use the git clone version for now. 

# Usage
Suppose you had the following figure

```julia
using PyPlot
plot(1:10)
xlabel("xx")
savefig("output.png")
```

All you need to do to create the EPS version of the file is
```julia
using PSPlot      # note the addition of PSPlot
plot(1:10)
xlabel("xx")
printfig("output2.eps")    # creates EPS with PSPlot
```
Notice that all that changed was `PyPlot` became `PSPlot`, and `savefig` became `printfig`. 

Of course, you can now insert the following code into your LaTeX file,
```latex
\usepackage{pstool} % pstool is the equivalent of psfrag for pdflatex
...
\begin{document}
...
\begin{figure}
\centering
\psfragfig[width=0.7\linewidth]{output2}{
\psfrag{xx}{$x$}
}
\end{figure}
....
```
As expected, upon running `pdflatex -shell-escape filename.tex`, the label `xx`
is replaced with the LaTeX ![](https://latex.codecogs.com/svg.latex?x).
Note that `PSPlot` alters the `matplotlibrc` to give plotting behavior more similar to
`MATLAB`.

## Minimal working example
You can see a complete minimal working example in the `example/` directory.
See `run.sh` to see the workflow.
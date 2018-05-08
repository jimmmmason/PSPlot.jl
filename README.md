# PSPlot.jl
A Julia wrapper for PyPlot generating EPS files that compile against PSTool in LaTeX

[![Build Status](https://travis-ci.org/reesepathak/PSPlot.jl.svg?branch=master)](https://travis-ci.org/reesepathak/PSPlot.jl)

The goal of this package is to allow Julia users to insert plots with `pstool` in LaTeX, just as MATLAB users can use
`psfrag`. 

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
# PSPlot.jl
A Julia wrapper for PyPlot generating EPS files that compile against PSTool in LaTeX

# Usage
Suppose you had the following figure

```julia
using PyPlot
plot(1:10)
xlabel("xx")
savefig("output.png")
```

All you need to do to additionally create the EPS file is
```julia
using PSPlot, PyPlot      # note the addition of PSPlot
plot(1:10)
xlabel("xx")
savefig("output1.png")     # (optional) creates png with PyPlot
printfig("output2.eps")    # creates EPS with PSPlot
```

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
As expected, upon running `pdflatex -shell-escape filename.tex`, you now will have
the label `xx` replaced with the LaTeX ![](https://latex.codecogs.com/svg.latex?x).
In other words, this matches the functionality of `psfrag` with `MATLAB`.

module PSPlot

using Reexport
ENV["MATPLOTLIBRC"] = joinpath(Pkg.dir("PSPlot"), "assets")
@reexport using PyPlot # makes all of PyPlot available

export printfig
include("figure.jl")

end # module

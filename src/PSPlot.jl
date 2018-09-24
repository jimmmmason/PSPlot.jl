module PSPlot

# load inkscape into path 
if !Sys.isapple()
    error("PSPlot currently only support OS X")
else
    using Homebrew
    brew_path = joinpath(Homebrew.prefix(), "bin")
    ENV["PATH"] = string(ENV["PATH"], ":", brew_path)
end

using Reexport
ENV["MATPLOTLIBRC"] = joinpath(Pkg.dir("PSPlot"), "assets")
@reexport using PyPlot # makes all of PyPlot available

export printfig
include("figure.jl")

end # module

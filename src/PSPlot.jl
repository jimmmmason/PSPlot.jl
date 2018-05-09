module PSPlot

if !is_apple()
    error("PSPlot currently only support OS X")
end
else
    using Homebrew
    brew_path = joinpath(Homebrew.prefix(), "bin")
    ENV["PATH"] = string(ENV["PATH"], ":", brew_path)
end

function call_inkscape(cmd)
    return run(`inkscape $cmd`)
end

using Reexport
ENV["MATPLOTLIBRC"] = joinpath(Pkg.dir("PSPlot"), "assets")
@reexport using PyPlot # makes all of PyPlot available

export printfig
include("figure.jl")

end # module

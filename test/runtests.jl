using PSPlot
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

# write your own tests here
using PyPlot
plot(1:10)
printfig("output.eps")
@test true
rm("output.eps")

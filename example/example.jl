using PSPlot

x = 1:10
y = 2x
plot(x, y, label="ll")
xlabel("xx")
ylabel("yy")
legend()
printfig("output.eps")

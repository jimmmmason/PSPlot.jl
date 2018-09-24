function remove_extension(s)
    arr = split(s, ".")
    return (length(arr) == 1) ? s : join(arr[1:(end-1)]) 
end

function pdf_to_eps(abspath, fname, dir)
    eps_name = joinpath(dir, "$(fname).eps") 
    run(`inkscape $abspath -E $eps_name --export-ignore-filters --export-ps-level=2`)
    return eps_name
end

function printfig(fname; kwargs...)
    dir, base = Base.Filesystem.dirname(fname), Base.Filesystem.basename(fname)
    filename = remove_extension(base)
    workdir = mktempdir()
    pdf_name = joinpath(workdir, "$(filename).pdf")
    PyPlot.savefig(pdf_name; rasterized=false, kwargs...)
    eps_path = pdf_to_eps(pdf_name, filename, workdir)
    cp(eps_path, joinpath(dir, basename(eps_path)), remove_destination=true)
end

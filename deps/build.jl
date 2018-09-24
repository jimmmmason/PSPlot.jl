if Sys.isapple()
    using Homebrew
    Homebrew.brew(`cask install inkscape`)
    brew_path = joinpath(Homebrew.prefix(), "bin")
    ENV["PATH"] = string(ENV["PATH"], ":", brew_path)
end



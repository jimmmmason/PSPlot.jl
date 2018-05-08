using BinDeps
@BinDeps.setup

inkscape = library_dependency("inkscape")

@osx_only begin
    using Homebrew
    provides(Homebrew.HB, "caskroom/cask/inkscape", inkscape, os= :Darwin)
end



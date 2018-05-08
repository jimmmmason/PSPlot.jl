using BinaryProvider

install_url = "https://inkscape.org/en/gallery/item/12187/inkscape-0.92.3.tar.bz2"
hash = "063296c05a65d7a92a0f627485b66221487acfc64a24f712eb5237c4bd7816b2"
install(install_url, hash; ignore_platform=true, force=true, prefix=Prefix("./deps"))

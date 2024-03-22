{ pkgs }:

let
  imgLink = "https://github.com/AngelJumbo/gruvbox-wallpapers/blob/main/wallpapers/irl/forest-river.jpg?raw=true";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-iY3492uQEzz6tWTJuI4HGTkr1GAc21isttjGka4sUtQ";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
    touch theme.conf
    echo "ForceHideCompletePassword=true" >> theme.conf
  '';
}


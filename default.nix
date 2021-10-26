{ pkgs, ... }:

pkgs.gcc11Stdenv.mkDerivation rec {
  name = "polymorphic-protocol";
  src = ./.;

  nativeBuildInputs = with pkgs; [ build2 python39Packages.compiledb ];

  configurePhase = ''
    bdep init -C ../${name}-gcc @gcc cc config.cxx=g++
  '';

  buildPhase = ''
    bd -v
  '';
}

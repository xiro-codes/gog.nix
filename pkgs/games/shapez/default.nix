{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "shapez";
  version = "0.1.0";
  paths = [
    { file = "shapez/shapez_1_0_57419.sh"; sha256 = "sha256-bovvban2KJqs78i9zGdNKSxklQU8D7bwK2TPy9VTK9o="; }
  ];
  fixup = ''
    # Fix missing libnss3.so
    wrapProgram $out/bin/shapez \
      --prefix LD_LIBRARY_PATH : ${inputs.nss}/lib:${inputs.nspr}/lib
  '';
  meta.broken = false;
}
  inputs


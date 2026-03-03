{ pname
, version
, path
, sha256
, fixup ? ""
, meta ? { }
,
}: { stdenvNoCC
   , fetchFile
   , innoextract
   , makeWrapper
   , lib
   , makeDesktopItem
   , wineWow64Packages
   , ...
   }:
let
  desktopItem = makeDesktopItem {
    name = pname;
    exec = pname;
    icon = pname;
    desktopName = pname;
    genericName = "Game";
    categories = [ "Game" ];
  };
in
stdenvNoCC.mkDerivation {
  name = "${pname}";
  src = fetchFile { inherit pname version path sha256; };
  nativeBuildInputs = [ innoextract makeWrapper ];
  buildInputs = [ wineWow64Packages.stable ];


  unpackPhase = "innoextract -e $src";


  installPhase = ''
    mkdir -p $out/share/${pname}
    cp -r * $out/share/${pname}
    makeWrapper ${wineWow64Packages.stable}/bin/wine $out/bin/${lib.toLower pname} \
      --add-flags "$out/share/${pname}/app/game.exe" \
      --set WINEPREFIX "$HOME/.local/share/wine-prefixes/${pname}"

  '';

  fixupPhase = fixup;
  meta = meta;
}

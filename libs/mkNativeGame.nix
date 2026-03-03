{ pname
, version
, path
, sha256
, fixup ? ""
, meta ? { }
,
}: { stdenvNoCC
   , fetchFile
   , zip
   , unzip
   , steam-run
   , makeWrapper
   , lib
   , makeDesktopItem
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
  nativeBuildInputs = [ zip unzip makeWrapper ];
  buildInputs = [ steam-run ];


  unpackPhase = ''
    mkdir -p $out/share/${pname}
    zip -F $src --out fixed.zip
    unzip -d $out/share/${pname} fixed.zip
    substituteInPlace $out/share/${pname}/data/noarch/start.sh --replace-warn chmod "#chmod"
  '';

  installPhase = ''
    makeWrapper ${steam-run}/bin/steam-run $out/bin/${pname} --add-flags $out/share/${pname}/data/noarch/start.sh
    mkdir -p $out/share/applications/ 
    cp ${desktopItem}/share/applications/* $out/share/applications
    ICON_SOURCE="$out/share/${pname}/data/noarch/support/icon.png";
    if [ -f "$ICON_SOURCE" ]; then
      mkdir -p $out/share/icons/hicolor/scalable/apps
      ln -s "$ICON_SOURCE" "$out/share/icons/hicolor/scalable/apps/${pname}.png"
    fi
  '';

  fixupPhase = fixup;
  meta = meta;
}

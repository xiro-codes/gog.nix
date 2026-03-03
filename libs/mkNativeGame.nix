{ pname
, version
, paths ? [ ]
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
  srcs = map
    (p: fetchFile {
      inherit pname version;
      path = p.file;
      sha256 = p.sha256;
    })
    paths;
  nativeBuildInputs = [ zip unzip makeWrapper ];
  buildInputs = [ steam-run ];


  unpackPhase = ''
    mkdir -p $out/share/${pname}
    for source in $srcs; do
      unzip -o -qq "$source" -d $out/share/${pname}/ || true
    done

    if [ -f $out/share/${pname}/data/noarch/start.sh ]; then
      substituteInPlace $out/share/${pname}/data/noarch/start.sh --replace-warn chmod "#chmod"
    fi
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

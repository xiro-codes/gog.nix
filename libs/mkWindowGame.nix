{ pname
, gameDir ? ""
, gameName ? ""
, version
, paths ? [ ]
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
  srcs = map (p: fetchFile { inherit pname version; path = p.file; sha256 = p.sha256; }) paths;
  nativeBuildInputs = [ innoextract makeWrapper ];
  buildInputs = [ wineWow64Packages.stable ];


  unpackPhase = '' 
    for source in $srcs; do
      fileName=$(stripHash "$source")
      echo "Linking: $fileName"
      ln -s "$source" "$fileName"
    done

    for file in *; do 
      if [[ "$file" == *.exe ]]; then
        innoextract -e $file
        break
      fi
    done
  '';


  installPhase = ''
    mkdir -p $out/share/${pname}
    cp -r * $out/share/${pname}
    makeWrapper ${wineWow64Packages.stable}/bin/wine $out/bin/${lib.toLower pname} \
      --add-flags "$out/share/${pname}/${gameName}" \
      --run 'mkdir -p "$HOME/.local/share/wine-prefixes" && export WINEPREFIX="$HOME/.local/share/wine-prefixes/${pname}"' 

    #mkdir -p $out/share/applications/ 
    #cp ${desktopItem}/share/applications/* $out/share/applications
    #ICON_SOURCE="$out/share/${pname}/app/*.ico;
    #if [ -f "$ICON_SOURCE" ]; then
    #  mkdir -p $out/share/icons/hicolor/scalable/apps
    #  ln -s "$ICON_SOURCE" "$out/share/icons/hicolor/scalable/apps/${pname}.ico"
    #fi
  '';

  fixupPhase = fixup;
  meta = meta;
}

{ pname
, bname ? pname
, needsWriteableDir ? false
, extraBuildInputs ? [ ]
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
   , autoPatchelfHook
   , makeDesktopItem
   , ...
   } @ pkgs:
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
  bname = bname;
  srcs = map
    (p: fetchFile {
      inherit pname version;
      path = p.file;
      sha256 = p.sha256;
    })
    paths;
  nativeBuildInputs = [ zip unzip makeWrapper autoPatchelfHook ];
  buildInputs = with pkgs; [
    steam-run
    libxxf86vm
    libGL
    libGLU
    vulkan-loader
    wayland
    libx11
    libxext
    libxcursor
    libxi
    libxinerama
    libxrandr
    libxrender
    libxtst
    libxxf86vm
    libpng # for libpng16.so.16
    libxscrnsaver # for libXss.so.1
    libxkbcommon # for libxkbcommon.so.0
    libbsd # for libbsd.so.0
    gtk2 # for libgtk-x11-2.0.so.0 and libgdk-x11-2.0.so.0
    pango # for libpango-1.0.so.0 and libpangocairo-1.0.so.0
    gdk-pixbuf # for libgdk_pixbuf-2.0.so.0
    cairo # for libcairo.so.2
    sndio # for libsndio.so (often needed by SDL2)
    alsa-lib
    libpulseaudio
    openal

    zlib
    openssl
    udev
    dbus
    glibc
    gcc-unwrapped.lib # Common for libstdc++.so.6
  ] ++ extraBuildInputs;


  unpackPhase = ''
    mkdir -p $out/share/${pname}
    for source in $srcs; do
      unzip -o -qq "$source" -d $out/share/${pname}/ || true
    done

    if [ -f $out/share/${pname}/data/noarch/start.sh ]; then
      substituteInPlace $out/share/${pname}/data/noarch/start.sh --replace-warn chmod "#chmod"
    fi
    # force executable permissions 
    find $out/share/${pname} -type f -exec chmod +x {} +
  '';

  installPhase =
    ''
      if [ "${toString needsWriteableDir}" = "1" ]; then
        LAUNCHER_SCRIPT=${pkgs.writeShellScript "${pname}-launcher" ''
          # We use a NIX variable here, but we escape it so it's 
          # replaced during the build of THIS game derivation.
          GAME_DIR="$HOME/.local/share/gog-nix/${pname}"
          mkdir -p "$GAME_DIR"
      
          # Use the absolute path that will be passed in via makeWrapper
          # or hardcoded by the build process.
          cp -rsf "$1/share/${pname}/." "$GAME_DIR/"
      
          chmod -R u+wx "$GAME_DIR"
          cd "$GAME_DIR"
          exec ${steam-run}/bin/steam-run "$GAME_DIR/data/noarch/start.sh" "$2"
        ''} 

        makeWrapper $LAUNCHER_SCRIPT $out/bin/${pname} --add-flags ${placeholder "out"}
      else 
        makeWrapper ${steam-run}/bin/steam-run $out/bin/${pname} --add-flags $out/share/${pname}/data/noarch/start.sh
      fi


      # Desktop Item 
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

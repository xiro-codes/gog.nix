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
   , ...
   }:
stdenvNoCC.mkDerivation {
  name = "${pname}";
  src = fetchFile { inherit pname version path sha256; };
  nativeBuildInputs = [ zip unzip makeWrapper ];
  buildInputs = [ steam-run ];

  sourceRoot = "source";

  unpackPhase = ''
    zip -F $src --out fixed.zip
    unzip -d source fixed.zip
    substituteInPlace source/data/noarch/start.sh --replace-warn chmod "#chmod"
  '';
  buildPahse = ''
    mkdir -p $out/share/${pname}
    cp -r source/* $out/share/${pname}
  '';
  installPhase = ''
    makeWrapper ${steam-run}/bin/steam-run $out/bin/${pname} --add-flags $out/share/${pname}/data/noarch/start.sh
  '';

  fixupPhase = fixup;
  meta = meta;
}

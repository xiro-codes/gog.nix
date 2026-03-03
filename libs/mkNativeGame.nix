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

  #sourceRoot = "source";

  unpackPhase = ''
    mkdir -p $out/share/${pname}
    zip -F $src --out fixed.zip
    unzip -d $out/share/${pname} fixed.zip
    substituteInPlace $out/share/${pname}/data/noarch/start.sh --replace-warn chmod "#chmod"
  '';
  buildPahse = ''
  '';
  installPhase = ''
    makeWrapper ${steam-run}/bin/steam-run $out/bin/${pname} --add-flags $out/share/${pname}/data/noarch/start.sh
  '';

  fixupPhase = fixup;
  meta = meta;
}

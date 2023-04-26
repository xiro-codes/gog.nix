{pkgs, ...}: {
  callPackageWith = set: path: overrides: (import path) (set // overrides);
  fetchNextcloud = { uname, pword, url}:
    {path, sha256}: pkgs.fetchurl {
      url = "${url}/${path}";
      curlOptsList = ["-X" "GET" "-u" "${uname}:${pword}"];
      inherit sha256;
    };
  mkNativeGame = {
    pname, # package name
    bname, # bin name
    path,
    sha256,
    fixup ? "",
    meta ? {},
  }:{
    stdenvNoCC,
    fetchNextcloud,
    requireFile,
    zip,
    unzip,
    makeWrapper,
    steam-run,
    curl,
    ...
  }: stdenvNoCC.mkDerivation {

    name = "${pname}";
    src = fetchNextCloud {inherit path sha256;};
    nativeBuildInputs = [zip unzip makeWrapper];
    buildInputs = [steam-run] ++ inputs;

    sourceRoot = "source";

    unpackPhase = ''
        zip -F $src --out fixed.zip
        unzip -d source fixed.zip
        substituteInPlace source/data/noarch/start.sh --replace chmod "#chmod"
    '';

    buildPhase = ''
      # no point its always readonly no issues so far
        mkdir -p $out/share/${pname}
        cp -r * $out/share/${pname}
    '';

    installPhase = ''
        makeWrapper ${steam-run}/bin/steam-run $out/bin/${bname} --add-flags $out/share/${pname}/data/noarch/start.sh
    '';

    fixupPhase = fixup;
    meta = meta;
  };
}

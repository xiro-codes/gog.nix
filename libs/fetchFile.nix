{ pkgs, ... }:
let
  serverUrl = "https://files.onix.home";
in
{ pname, version, path, sha256 }: pkgs.fetchurl {
  name = baseNameOf path;
  url = "${serverUrl}/${path}";
  curlOptsList = [ "-X" "GET" "--insecure" ];
  inherit sha256;
}

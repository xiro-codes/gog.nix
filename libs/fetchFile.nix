{ pkgs, ... }: { url, path, sha256 }: pkgs.fetchurl {
  url = "${url}/${path}";
  curlOptsList = [ "-X" "GET" "--insecure" ];
  inherit sha256;
}

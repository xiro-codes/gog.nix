{pkgs, ...}: { uname, pword, url}: {path, sha256}: pkgs.fetchurl { url = "${url}/${path}"; curlOptsList = ["-X" "GET" "-u" "${uname}:${pword}"]; inherit sha256;}

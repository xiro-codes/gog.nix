{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "torchlight-ii";
  version = "0.1.0";
  paths = [
    { file = "torchlight_ii/gog_torchlight_2_2.0.0.2.sh"; sha256 = "sha256-rlDH9tQj9ZJCy31r8LUliA6UBhpVT8PDdWHbelVoyZg="; }
  ];
  # support/gog_com.shlib: line 94: 297362 Segmentation fault         (core dumped) ./"${bin_64}"
  meta.broken = true;
}
  inputs


{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "oxenfree";
  version = "0.1.0";
  paths = [
    { file = "oxenfree/oxenfree_2_7_1_27542.sh"; sha256 = "sha256-92SKDi5Xws8c8LIrk69BPm1MgZvg+Xa6aXq+FHKHdQA="; }
  ];
  # unknown no useful output in shell
  meta.broken = false;
}
  inputs


{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "inscryption";
  version = "0.1.0";
  paths = [
    { file = "inscryption/inscryption_1_10_linux_57447.sh"; sha256 = "sha256-ff75rwTcj6MI8nGuIh9vrZDnyQESxM4vyxhs7lLF9Ew="; }
  ];
}
  inputs
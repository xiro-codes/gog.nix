{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "bastion";
  version = "0.1.0";
  paths = [
    { file = "bastion/bastion_1_0_1747_initial_test_33876.sh"; sha256 = "sha256-O+O8N8sk0wMfnkabl6FmOa2Bo+ohf88ghl2eA0rlI7Y="; }
  ];
  meta = {
    why = "something about broke when changing mkNativeGame TODO(bring back the old version to handle this game NOTE(prob should be the default version used for all games ))";
    broken = true;
  };
}
  inputs


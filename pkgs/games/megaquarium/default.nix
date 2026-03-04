{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "megaquarium";
  version = "0.1.1";
  paths = [
    { file = "megaquarium/megaquarium_v5_0_12g_89146.sh"; sha256 = "sha256-DWxym9Hipt4Yl4pVpZlZXnL/vgM7uDFnEujXnUqTKnM="; }
  ];
}
  inputs


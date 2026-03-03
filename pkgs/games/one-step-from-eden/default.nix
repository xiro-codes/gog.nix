{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "one-step-from-eden";
  version = "0.1.0";
  paths = [
    { file = "one_step_from_eden/one_step_from_eden_1_8_2_63427.sh"; sha256 = "sha256-L6lmXqTFqHdIX5gATtT88Mx4e2NVwbLDdXzumgnmXJo="; }
  ];
}
  inputs
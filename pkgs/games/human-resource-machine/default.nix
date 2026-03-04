{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "human-resource-machine";
  version = "0.1.0";
  paths = [
    { file = "human_resource_machine/gog_human_resource_machine_2.0.0.3.sh"; sha256 = "sha256-7TTdb79CQjhNq/H0aQpMGQHjoMEmcEX7nQpzZBt7IWk="; }
  ];
}
  inputs
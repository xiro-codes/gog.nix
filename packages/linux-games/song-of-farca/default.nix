{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "song-of-farca";
  version = "0.1.0";
  paths = [
    { file = "song_of_farca/song_of_farca_1_0_2_15_59133.sh"; sha256 = "sha256-K8gYZStpnakmzKhPyDsXTs32Ch1afVWshrsMmJOhSIg="; }
  ];
}
  inputs
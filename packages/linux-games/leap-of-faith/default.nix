{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "leap-of-faith";
  version = "0.1.0";
  paths = [
    { file = "leap_of_faith/leap_of_faith_official_walkthrough_v1_0_3gog_lin_wt_62416.sh"; sha256 = "sha256-QOmgiGGdUCqYJIkKxadj4QUxWwQv+U9M3VyOFd3wV9w="; }
  ];
}
  inputs
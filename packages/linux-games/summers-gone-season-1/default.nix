{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "summers-gone-season-1";
  version = "0.1.0";
  paths = [
    { file = "summers_gone_season_1/summer_s_gone_season_1_1_3_25_l_84044.sh"; sha256 = "sha256-6nGOWMGQ1fLDYlBTBN1mjdjnUU+GarenH2heN6NSUpQ="; }
  ];
  # WHAT start.sh trys to run a exe
  # /nix/store/d73z7vqrkr439cq2h3zcdf8prlha9h02-summers-gone-season-1/share/summers-gone-season-1/data/noarch/start.sh: line 20: ./SummersGone_Season1_GOG.exe: cannot execute binary file: Exec format error
  meta.broken = true;
}
  inputs


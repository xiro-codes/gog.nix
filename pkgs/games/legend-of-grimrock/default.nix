{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "legend-of-grimrock";
  version = "0.1.0";
  paths = [
    { file = "legend_of_grimrock/gog_legend_of_grimrock_2.1.0.5.sh"; sha256 = "sha256-xfoQZJd+TfQ4nUW+EqZV8VEifQiiLzBYvEvG6WJ9GvE="; }
  ];
}
  inputs
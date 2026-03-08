{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "orwell";
  version = "0.1.0";
  paths = [
    { file = "orwell/orwell_1_4_9208_80802.sh"; sha256 = "sha256-pkEHg58/YWJ30FWi8gHgCzk6J/Lg+1w5cS16R8kioUg="; }
  ];
  # /nix/store/c4vy52jlyd3qjalaj7nc6qshif7famvc-orwell/share/orwell/data/noarch/start.sh: line 16: 239037 Segmentation fault         (core dumped) ./"Orwell.x86_64"

  meta.broken = false;
}
  inputs


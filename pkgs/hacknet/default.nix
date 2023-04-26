{builders, ...} @ inputs:
builders.mkNixGame {
  pname = "hacknet";
  path = "Games/hacknet.sh";
  sha256 = "sha256-uQaqgPj/UmzWOIpUqN6Ez3Ndn2V2DjiZbhurHMSzM70=";
  broken = true;
}
inputs

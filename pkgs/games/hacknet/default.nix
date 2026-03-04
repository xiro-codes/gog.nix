{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "hacknet";
  version = "0.1.0";
  paths = [
    { file = "hacknet/hacknet_en_5_069_15083.sh"; sha256 = "sha256-uQaqgPj/UmzWOIpUqN6Ez3Ndn2V2DjiZbhurHMSzM70="; }
  ];
  fixup = ''
    # Fix missing libnss3.so
    wrapProgram $out/bin/hacknet \
      --prefix LD_LIBRARY_PATH : ${inputs.nss}/lib
  '';
  # ./Hacknet.bin.x86_64: error while loading shared libraries: libnspr4.so: cannot open shared object file: No such file or directory
  meta.broken = true;
}
  inputs


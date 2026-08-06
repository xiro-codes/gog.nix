{ mkNativeGame, ... }@inputs:
mkNativeGame {
  pname = "crypt-of-the-necrodancer";
  version = "4.2.1";
  paths = [
    {
      file = "crypt-of-the-necrodancer/crypt_of_the_necrodancer_4_2_1_b5646_87306.sh";
      sha256 = "sha256-p0RCIYKk0bQnskdU2nzTfjGsRVT7oU8pPCmvv76z1I4=";
    }
  ];
  needsWriteableDir = true;
} inputs

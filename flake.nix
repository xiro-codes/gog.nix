{
  description = "Contains GOG games packaged for use with nix";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    libs = import ./libs { inherit pkgs; };
  in {
    packages.${system} = import ./pkgs { inherit pkgs libs; };
  };
}

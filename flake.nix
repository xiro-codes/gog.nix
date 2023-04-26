{
  description = "Contains GOG games packaged for use with nix";
  inputs.alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  outputs = {
    self,
    nixpkgs,
    alejandra,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    libs = import ./libs {inherit pkgs;};
  in {
    packages.${system} = import ./pkgs {inherit pkgs libs;};
    devShells.${system}.default = pkgs.mkShell {
      packages = [alejandra.defaultPackage.${system}];
    };
  };
}

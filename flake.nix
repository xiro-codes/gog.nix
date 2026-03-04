{
  description = "Contains GOG games packaged for use with nix";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    { self
    , nixpkgs
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      libs = import ./libs { inherit pkgs; };
    in
    {
      packages.${system} = import ./pkgs {
        inherit pkgs libs;
      };
      nixosModules = {
        gog = ./modules/gog/default.nix;
        gog-sync = ./modules/gog-sync/default.nix;
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [ python3 just ];
      };
    };
}

{
  description = "Minimal WSL-first NixOS flake for Zell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.disko.follows = "disko";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nixos-wsl, stylix, ... }:
    let
      system = "x86_64-linux";
      mkHomeManager = {
        username,
        homeDirectory,
      }: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit inputs username homeDirectory;
        };
        home-manager.users.${username} = import ./home/${username};
      };
    in {
      nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          hostname = "wsl";
          username = "zell";
        };
        modules = [
          nixos-wsl.nixosModules.default
          stylix.nixosModules.stylix
          ./hosts/wsl
          home-manager.nixosModules.home-manager
          (mkHomeManager {
            username = "zell";
            homeDirectory = "/home/zell";
          })
        ];
      };

      nixosConfigurations.gallifrey = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          hostname = "gallifrey";
          username = "zell";
        };
        modules = [
          stylix.nixosModules.stylix
          ./hosts/gallifrey
          home-manager.nixosModules.home-manager
          (mkHomeManager {
            username = "zell";
            homeDirectory = "/home/zell";
          })
        ];
      };
    };
}

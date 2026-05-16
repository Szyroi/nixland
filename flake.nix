{
  description = "My Hyprland config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...}: {
    homeManagerModules = {
      nixland = ./hyprland/default.nix;
      default = self.nixland.homeManagerModules.nixland;
    };

    homeManagerModule = self.homeManagerModules.nixland;
  };
}

{
  description = "My Hyprland config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {self, ...}: {
    nixosModules.default = import ./hyprland/default.nix {
      inherit self;
    };
  };
}

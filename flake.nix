{
  description = "nixland - Hyprland home-manager module";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {self, ...}: {
    homeManagerModules.default = import ./hyprland/default.nix;
  };
}

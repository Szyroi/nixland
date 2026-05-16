{self}: {
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.nixland;
in {
  options.nixLand = {
    enable = lib.mkEnableOption "Enable Hyprland config";

    profile = lib.mkOption {
      type = lib.types.enum ["desktop" "laptop"];
      default = "desktop";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
    };

    environment.systemPackages = with pkgs; [
      hyprpaper
      wofi
      kitty
    ];

    home.file.".config/hypr/".source =
      if cfg.profile == "laptop"
      then self + /hyprland/laptop
      else self + /hyprland/desktop;
  };
}

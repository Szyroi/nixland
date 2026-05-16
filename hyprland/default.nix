{self}: {
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.nixland;
in {
  options.nixland = {
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

    home.packages = with pkgs; [
      hyprpaper
      wofi
      kitty
    ];

    home.file.".config/hypr".source =
      self + "/hyprland/${cfg.profile}";
  };
}

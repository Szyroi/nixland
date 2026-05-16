{
  self,
  config,
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
    xdg.configFile."hypr".source = "${self}/hyprland/${cfg.profile}";
  };
}

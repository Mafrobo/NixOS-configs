{ config, lib, pkgs, ... }:

let cfg = config.myHyprland;

in {
  options.myHyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Hyprland as the Wayland compositor.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ hyprland kitty ];

    services.displayManager.defaultSession = "hyprland";
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}


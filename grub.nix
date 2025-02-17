{ config, pkgs, lib, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices = {
      "cryptlvm" = {
        device = "/dev/disk/by-uuid/a436bdfe-017a-49d5-b5db-ab4a75bd9c0b";
        preLVM = true;
        allowDiscards = true;
      };
    };
  };
}


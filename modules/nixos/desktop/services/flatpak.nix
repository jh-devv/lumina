{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop.services.flatpak;
in {
  config = mkIf cfg.enable {
    services.flatpak.enable = true;
  };
}

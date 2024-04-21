{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  flake.nixosConfigurations.luminara = withSystem "x86_64-linux" (_:
    nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        inputs.lanzaboote.nixosModules.lanzaboote
        ./luminara
        ../modules/nixos
      ];
    });
}

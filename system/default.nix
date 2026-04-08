{ lib, nur, home-manager, hexecute, openclaw, nixvim, nixpkg-unstable, ... }:
{ hostname, profiles }:

let
  hosts = import ../hosts;
  hostEntry = hosts.${hostname} or (throw "Host ${hostname} not found");
  hostHardwareConfig = hostEntry.hardwareConfig;

  hostProfile = profiles.hosts.${hostname};
  system = hostProfile.host.system;
in lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit hostname nur hexecute openclaw nixvim system;
    nixpkg-unstable.pkgs = import nixpkg-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  };
  modules = [
    ({ ... }: { config.profile = profiles; })

    hostHardwareConfig

    home-manager.nixosModules.home-manager
    nur.modules.nixos.default

    ./home-aux
    ./software
    ./global
    ../desktop/nixos.nix

    ./options.nix
  ];
}

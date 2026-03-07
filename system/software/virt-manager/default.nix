{ config, lib, hostname, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config hostname;
    name = "virt-manager";
  };
  inner = import ./inner.nix { inherit lib config hostname; };
in mkSystemSoftware inner

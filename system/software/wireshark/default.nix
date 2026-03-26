{ config, lib, pkgs, hostname, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config hostname;
    name = "wireshark";
  };
  inner = import ./inner.nix { inherit lib config pkgs hostname; };
in mkSystemSoftware inner

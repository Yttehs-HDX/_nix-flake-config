{ config, lib, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "codex";
  };
  inner = import ./inner.nix { inherit config lib; };
in mkSoftware inner

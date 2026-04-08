{ config, lib, nixpkg-unstable, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "vscode";
  };
  inner = import ./inner.nix { inherit nixpkg-unstable; };
in mkSoftware inner

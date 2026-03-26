{ lib, config, pkgs, hostname, ... }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  integrated = lookup.getHostIntegratedProfile config hostname;
  usersInLibvirtd =
    lib.genAttrs integrated.usernames (_: { extraGroups = [ "wireshark" ]; });
in {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark-qt;
  };

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.users = usersInLibvirtd;
}

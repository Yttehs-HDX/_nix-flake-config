{ lib, config, hostname, ... }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  integrated = lookup.getHostIntegratedProfile config hostname;
  usersInLibvirtd =
    lib.genAttrs integrated.usernames (_: { extraGroups = [ "libvirtd" ]; });
in {
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.users = usersInLibvirtd;
}

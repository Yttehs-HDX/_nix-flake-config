{ lib, config, hostname, ... }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  integrated = lookup.getHostIntegratedProfile config hostname;
  usersInDocker =
    lib.genAttrs integrated.usernames (_: { extraGroups = [ "docker" ]; });
in {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  users.users = usersInDocker;
}

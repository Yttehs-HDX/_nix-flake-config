{ ... }:

{
  programs.openclaw = {
    enable = true;
    excludeTools = [ "git" "jq" "ripgrep" "uv" ];
  };
}

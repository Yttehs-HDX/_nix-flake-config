{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.copilot-cli ];

  # enableZshCompletion
  programs.zsh.initContent = lib.mkIf config.programs.zsh.enable (lib.mkAfter ''
    eval "$(copilot completion zsh)"
  '');
}

{ config, lib, ... }:

{
  programs.codex.enable = true;

  # enableZshCompletion
  programs.zsh.initContent = lib.mkIf config.programs.zsh.enable (lib.mkAfter ''
    eval "$(codex completion zsh)"
  '');
}

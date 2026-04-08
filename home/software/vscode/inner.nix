{ nixpkg-unstable, ... }:

{
  programs.vscode = {
    enable = true;
    package = nixpkg-unstable.pkgs.vscode;
  };
}

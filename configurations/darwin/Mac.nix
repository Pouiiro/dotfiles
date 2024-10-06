# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "Mac";

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."eru".home = "/Users/eru";

  # Enable home-manager for "eru" user
  home-manager.users."eru" = {
    imports = [(self + /configurations/home/eru.nix)];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

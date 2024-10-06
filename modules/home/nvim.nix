{lib, ...}: {
  programs = {
    neovim = {
      enable = true;
      extraConfig = ''
      '';
    };
  };

  home.file.".config/nvim" = {
    source = ./custom/nvim;
    recursive = true;
  };
}

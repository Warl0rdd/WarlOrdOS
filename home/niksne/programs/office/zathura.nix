{pkgs, ...}: {
  programs.zathura = {
    enable = true;

    catppuccin.enable = true;

    options = {
      font = "JetBrainsMono Nerd Font 12";
      selection-notification = true;

      selection-clipboard = "clipboard";
      adjust-open = "best-fit";
      pages-per-row = "1";
      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      scroll-step = "100";
      zoom-min = "10";
    };
  };
}

{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    # 如果用 fcitx5
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
       fcitx5-chinese-addons
       fcitx5-rime
       fcitx5-gtk
       fcitx5-nord
       libsForQt5.fcitx5-qt
    ];
    fcitx5.waylandFrontend = true;

    # 我现在用 ibus
    #type = "ibus";
    #ibus.engines = with pkgs.ibus-engines; [
    #  rime
    #];
  };


  fonts = {
    packages = with pkgs; [
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      #fira-code-nerdfont
      nerd-fonts.noto
      nerd-fonts.jetbrains-mono
    ];


    # 简单配置一下 fontconfig 字体顺序，以免 fallback 到不想要的字体
    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "JetBrainsMono Nerd Font Mono"
          "Noto Sans Mono CJK SC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK SC"
          "DejaVu Sans"
        ];
        serif = [
          "Nato Serif"
          "Noto Serif CJK SC"
          "DejaVu Serif"
        ];
      };
    };

  };
}

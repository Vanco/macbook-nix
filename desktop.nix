{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  #services.xserver.dpi = 227;

  # Enable the Pantheon Desktop Environment.
  # services.displayManager.sddm = {
  #   enable = true;
  #   theme = "chili"; # chili  elarun  maldives  maya
  #   wayland.enable = true;
  #   # wayland.compositor = "labwc";
  # };
  # services.displayManager.sddm.wayland.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  #services.desktopManager.cosmic.xwayland.enable = false;
  #services.desktopManager.plasma6.enable = true;
  #services.desktopManager.lomiri.enable = true;
  # services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.pantheon.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.desktopManager.budgie.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.desktopManager.xfce.enableWaylandSession = true;
  #services.pantheon.apps.enable = false;
  #services.desktopManager.plasma6.enableQt5Integration = false;

  # services.xserver = {
  #     enable = true;
  #     desktopManager = {
  #       xterm.enable = false;
  #       lxqt.enable = true;
  #     };
  #   };
  # services.displayManager.defaultSession = "xfce";

  # Configure keymap in X11
  # services.xserver.xkb = {
  #  layout = "us";
  #  variant = "";
  # };

  # enable sway window manager
  #programs.sway = {
  #  enable = true;
   # xwayland.enable = false;
  #  wrapperFeatures.gtk = true;
  #};
  #programs.waybar.enable = true;
  # programs.hyprland = {
  #  enable = true;
  #  # withUWSM = true;
  # };
  #programs.uwsm.enable = true;
  #programs.uwsm.waylandCompositors = {
  #sway = {
   # prettyName = "Sway";
   # comment = "Sway compositor managed by UWSM";
   # binPath = "/run/current-system/sw/bin/sway";
   # };
  #hyprland = {
   # prettyName = "Hyprland";
   # comment = "Hyprland compositor managed by UWSM";
   # binPath = "/run/current-system/sw/bin/Hyprland";
   # };
  #};

  # programs.wayfire = {
  #   enable = true;
  #   plugins = with pkgs.wayfirePlugins; [
  #     wcm
  #     wf-shell
  #     wayfire-plugins-extra
  #   ];
  # };

  # programs.river = {
  #   enable = true;
  #   extraPackages = with pkgs; [
  #     dmenu foot rofi light
  #   ];
  # };
  #
  # environment.systemPackages = with pkgs; [
  #    sddm-chili-theme wofi waybar hyprpaper mako
  #    grim slurp swappy cliphist yazi yaziPlugins.starship
  #    wl-clipboard-rs file
  #  ];
}

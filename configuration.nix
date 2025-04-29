# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./input-method.nix
      ./desktop.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # for macbook facetime camera
  hardware.facetimehd.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #networking.wireless.userControlled.enable = true;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #networking.hosts = { "140.82.144.4" = [ "github.com" ]; };
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  #services.xserver.dpi = 227;

  # Enable the Pantheon Desktop Environment.
  #services.displayManager.sddm.enable = true;
  #services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;
  # services.desktopManager.cosmic.enable = true;
  #services.desktopManager.cosmic.xwayland.enable = false;
  #services.desktopManager.plasma6.enable = true;
  #services.desktopManager.lomiri.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.pantheon.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.desktopManager.budgie.enable = true;
  #services.pantheon.apps.enable = false;
  #services.desktopManager.plasma6.enableQt5Integration = false;

  # Configure keymap in X11
  #services.xserver.xkb = {
  #  layout = "us";
  #  variant = "";
  #};

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #hardware.pulseaudio.enable = false;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  services.libinput.enable = true;

  # Enable the gnome-keyring secrets vault.
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.van = {
    isNormalUser = true;
    description = "Van";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    zed-editor
    webcamoid
    #motrix
    #jetbrains-toolbox
    ];
  };

  # enable sway window manager
  #programs.sway = {
  #  enable = true;
   # xwayland.enable = false;
  #  wrapperFeatures.gtk = true;
  #};
  #programs.waybar.enable = true;
  #programs.hyprland = {
   # enable = true;
   # xwayland.enable = false;
   # withUWSM = true;
  #};
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
  # Install firefox.
  programs.firefox.enable = true;
  programs.java.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim git dig wget git-credential-manager
    nixd
    starship
    ghostty
    neofetch htop
    # wlroots wl-clipboard
    #wofi waybar hyprpaper mako grim slurp swappy cliphist
    #blueman
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" ];
}

#Github Test
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


# try adding the following to the /etc/nixos/configuration.nix

 programs.java = { enable = true; package = pkgs.oraclejre8; };

#Steam
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};

#Flatpak
services.flatpak.enable = true;


#VMWARE
virtualisation.vmware.host.enable = true; 

#YUBI
services.pcscd.enable = true;

 # NVidia
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true; 


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jon = {
    isNormalUser = true;
    description = "jon";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
	pavucontrol	
	librewolf
	firefox	
	audacious
	steam
	steam-run
	lutris
	yubioath-flutter
	signal-desktop
	gimp
	rpcs3
	betterbird
	qbittorrent
	vlc
	heroic
	xarchiver
	airshipper
	minetest
	prismlauncher
	mari0
	superTux
	keepassxc
	xfce.mousepad
	nox
	electron-mail
	mumble
	murmur
	openjdk
	qalculate-qt
	strawberry 
	pcsx2
	dolphin-emu
	jdk17
	yuzu-mainline
	dolphin-emu
	maestral-gui
	chromium
        

    ];
  };

  # Allow unfree packages
nixpkgs.config = {  
  allowUnfree = true;
};





  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	pkgs.gparted
	pkgs.gnome.gnome-tweaks
	pkgs.vmware-workstation
	pkgs.gnomeExtensions.drop-down-terminal
	pkgs.htop
	pkgs.pcsclite
	pkgs.reaper
	pkgs.xboxdrv
	pkgs.jdk17
	pkgs.adguardhome
	pkgs.opensnitch
	pkgs.opensnitch-ui
	pkgs.home-manager
	pkgs.nettools
	pkgs.linuxKernel.packages.linux_5_4.wireguard
	pkgs.networkmanager
	pkgs.wireguard-tools
	# support both 32- and 64-bit applications
        wineWowPackages.stable
	winetricks
	dxvk
	vkd3d
	vkd3d-proton
	cdemu-client
	cdemu-daemon
	wineasio
	gnomeExtensions.arcmenu
	nfs-utils

	
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

 programs.chromium = {
  enable = true;
  extensions = [
"cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
"eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
"gebbhagfogifgggkldgodflihgfeippi" # Return YouTube Dislike
"mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for YouTube
"cmjhejfkhdonjimgkinjdombabgfbcal" # YouTube Livestreams Theater Mode
 ];
};

  # List services that you want to enable:
	services.adguardhome.enable = true;
	services.opensnitch.enable = true;
	services.geoclue2.enable = true;
	services.invidious.enable = true;	

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [64738];
  # networking.firewall.allowedUDPPorts = [64738];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  }


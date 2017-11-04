# Ubuntu Desktop Install / Reinstall / Recovery

- Reinstall:

		sudo apt-get update
		sudo apt-get install --reinstall ubuntu-desktop
		sudo apt-get install --reinstall unity
		
- Chande the display manager (greeter):

		#sudo dpkg-reconfigure lightdm 		
		#sudo dpkg-reconfigure gdm3
		#sudo dpkg-reconfigure sddm

- Restore Unity Greeter:

		sudo apt remove --purge lightdm-gtk-greeter
		sudo apt remove --purge sddm
		sudo apt remove --purge sddm

- [Show the desctop icons and the background image](https://ubuntuforums.org/showthread.php?t=2246432), and eanable the right lick on the desktop **after XFCE** (etc.) installation:

		gsettings set org.gnome.desktop.background show-desktop-icons true

- References:

    - [**Restore Unity Greeter**](https://askubuntu.com/a/550404/566421)
    - [**How do I change the wallpaper of the login screen?**](https://askubuntu.com/questions/64001/how-do-i-change-the-wallpaper-of-the-login-screen)
    - [**How do I set the LightDM wallpaper in Ubuntu 14.04?**](https://askubuntu.com/questions/449677/how-do-i-set-the-lightdm-wallpaper-in-ubuntu-14-04)
    - [How can I make LightDM the default display manager?](https://askubuntu.com/questions/58023/how-can-i-make-lightdm-the-default-display-manager)
    - [How to purge SDDM/Plasma completely](https://askubuntu.com/questions/715108/how-to-purge-sddm-plasma-completely)
    - [How do I reinstall Unity?](https://askubuntu.com/questions/95458/how-do-i-reinstall-unity)
    - [How to Choose & Switch Linux Display Managers](http://www.makeuseof.com/tag/choose-switch-linux-display-managers/) 
    
# Desctop Environments installation

## Gnome Shell | Ubuntu Gnome Desktop

- Install:

		sudo apt update
		sudo apt install ubuntu-gnome-desktop

- Only Gnome Shell:

		sudo apt install gnome-shell
		
- Uninstall:

		sudo apt remove --purge ubuntu-gnome-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - [Install gnome-shell on ubuntu 16.04](https://askubuntu.com/questions/766071/install-gnome-shell-on-ubuntu-16-04)
    - [Using GNOME in ubuntu 16.04 LTS](https://askubuntu.com/questions/781559/using-gnome-in-ubuntu-16-04-lts)
    - [What kinds of desktop environments and shells are available? | GNOME Shell](https://askubuntu.com/a/65223/566421)
    
## XFCE4 | XUbuntu Desktop

- Install:

		sudo apt update
		sudo apt-get install xubuntu-desktop
		# sudo apt-get install xfce4
		
- Uninstall:

		sudo apt remove --purge xubuntu-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - [How can I install XFCE along side Unity?](https://askubuntu.com/questions/223536/how-can-i-install-xfce-along-side-unity)
    - [How to I change from Ubuntu to Xubuntu?](https://askubuntu.com/questions/65861/how-to-i-change-from-ubuntu-to-xubuntu)
    - [Desctop Icons Recovery 1](https://askubuntu.com/questions/451847/desktop-icons-not-showing-up-in-xubuntu-and-i-cant-right-click-on-the-desktop) | [Desctop Icons Recovery 2](https://bbs.archlinux.org/viewtopic.php?id=127138) 

## LXDE | Lubuntu Desktop (Lubuntu Netbook)

- Install:

		sudo apt update
		sudo apt-get install lubuntu-desktop

- Alternatively install only LXDE:

		sudo apt update
		sudo apt-get install lxde
		
- Uninstall:

		sudo apt remove --purge lubuntu-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - [How to Install the Lightweight LXDE Desktop on Ubuntu](https://www.howtogeek.com/107368/how-to-install-the-lightweight-lxde-desktop-on-ubuntu/)
    
## LXQt

- Install:

		sudo apt update
		sudo apt install lxqt lxqt-session* openbox
	
	It is possible, when you log into LXQt, to be asked to set default session mannager - choose `open` (`/usr/bin/openbox`). Recovery from wrong sesion manager: establish `ssh -X` connection, run `lxqt-config-session` and change the session manager.
		
- Uninstall:

		sudo apt remove --purge lxqt lxqt-session*
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - [Ubuntu LXQt / Lubuntu](https://wiki.ubuntu.com/Lubuntu/LXQt) | [LXQt.org](http://lxqt.org/)
    - [How to Install Latest LXQt Desktop in Ubuntu 16.04/16.10 and Fedora 22-24](https://www.tecmint.com/install-lxqt-desktop-in-ubuntu-fedora/)
    - [LXQt-Session at GitHub](https://github.com/lxde/lxqt-session)
    
## Mate | Ubuntu Mate
		
- Install Mate from PPA:

		sudo add-apt-repository ppa:jonathonf/mate-1.18
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8CF63AD3F06FC659
		sudo apt update && sudo apt full-upgrade
		sudo apt update && sudo apt install mate-core mate-desktop-environment
		sudo apt install --install-suggests mate-desktop
	
- Uninstall:
	
		sudo apt install ppa-purge 
		sudo ppa-purge ppa:jonathonf/mate-1.18
		sudo apt update && sudo apt autoremove && sudo apt autoclean


- Alternativelly Install Ubuntu Mate Desktop:

		sudo apt install ubuntu-mate-desktop
		sudo apt install ubuntu-mate-core ubuntu-mate-desktop
		
- References:

    - [How to Install MATE Desktop 1.18 in Ubuntu 16.04](http://tipsonubuntu.com/2017/03/15/install-mate-desktop-1-18-in-ubuntu-16-04/)
    - [How to Install MATE Desktop 1.16 in Ubuntu 16.04](http://tipsonubuntu.com/2016/09/23/install-mate-desktop-1-16-ubuntu-16-04/)
    - [MATE Desktop 1.16 for Ubuntu MATE 16.04](https://ubuntu-mate.org/blog/mate-desktop-116-for-xenial-xerus/)
    - [How do I install MATE (the desktop environment)?](https://askubuntu.com/questions/87040/how-do-i-install-mate-the-desktop-environment)
    
## Cinnamon Desktop (Mint) | Cinnamon2d | Cinnamon (Software Rendering)

- Install:

		sudo add-apt-repository ppa:embrosyn/cinnamon
		sudo apt update && sudo apt upgrade
		sudo apt-get install cinnamon
	
- Uninstall:
	
		sudo apt install ppa-purge 
		sudo ppa-purge ppa:embrosyn/cinnamon
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - [How to Install Latest Cinnamon Desktop in Ubuntu and Fedora](https://www.tecmint.com/install-cinnamon-desktop-in-ubuntu-fedora-workstations/)


## KDE Plasma | Kubuntu 

- Install:

		sudo apt-get install kubuntu-desktop
		# Recovery
		sudo dpkg -i --force-overwrite  /var/cache/apt/archives/kde-config-telepathy-accounts_4%3a15.12.3-0ubuntu1_amd64.deb
		sudo apt-get install -f
	
- Uninstall:
	
		sudo apt remove --purge kubuntu-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - [Help installing kubuntu-desktop on Ubuntu 16.04](https://askubuntu.com/questions/764542/help-installing-kubuntu-desktop-on-ubuntu-16-04)
    - [Unable to install kubuntu-Desktop in ubuntu 16.04 Lts](https://askubuntu.com/questions/768786/unable-to-install-kubuntu-desktop-in-ubuntu-16-04-lts)

       
## Pantheon - desn't work at all!
 <!--
- Install:

		sudo add-apt-repository ppa:elementary-os/stable
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E1F8A59
		sudo apt update && sudo apt dist-upgrade
		sudo apt install elementary-desktop
		sudo apt install elementary-theme elementary-icon-theme elementary-default-settings elementary-desktop
		
		sudo add-apt-repository ppa:elementary-os/daily && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E1F8A59 && sudo apt update && sudo apt upgrade
		sudo add-apt-repository add-apt-repository ppa:elementary-os/os-patches && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E1F8A59 && sudo apt update && sudo apt upgrade
		sudo add-apt-repository ppa:elementary-os/testing && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E1F8A59 && sudo apt update && sudo apt upgrade
		#sudo add-apt-repository ppa:elementary-os/testing && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BFF792D0 && sudo apt update && sudo apt upgrade
		sudo apt install elementary-theme elementary-icon-theme elementary-default-settings elementary-desktop
	
- Uninstall:
	
		sudo apt install ppa-purge 
		sudo ppa-purge ppa:elementary-os/stable # etc..
		sudo apt update && sudo apt autoremove && sudo apt autoclean</s>
-->	
- References:

    - [How do you install Pantheon on Ubuntu 16.04?](https://askubuntu.com/questions/766673/how-do-you-install-pantheon-on-ubuntu-16-04)
    - [How To Install Pantheon Desktop In Ubuntu](https://www.linuxhelp.com/how-to-install-pantheon-desktop-in-ubuntu/)
    
## The Lumina® Desktop Environment

- Install:

		sudo add-apt-repository ppa:samoilov-lex/lumina-desktop
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FA1A38EB
		sudo apt update
		sudo apt install lumina-desktop qterminal
	
- Uninstall:
	
		sudo apt install ppa-purge 
		sudo ppa-purge ppa:samoilov-lex/lumina-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - [What kinds of desktop environments and shells are available? | The Lumina® Desktop Environment](https://askubuntu.com/a/832713/566421)
    
 ## Fluxbox

- Install:

		sudo apt install fluxbox
	
- Uninstall:
	
		sudo apt remove --purge fluxbox
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
    
## Xmonad

- Install:

		sudo apt-get install xmonad xmobar trayer
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FA1A38EB
		sudo apt update && sudo apt upgrade

- Uninstall:
	
		sudo apt remove --purge xmonad xmobar trayer 
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - [What kinds of desktop environments and shells are available? | Xmonad](https://askubuntu.com/a/871567/566421)
    
## Subtle

- Install:

		sudo apt install subtle
		sudo apt update && sudo apt upgrade
	
- Uninstall:
	
		sudo apt remove --purge subtle 
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - [What kinds of desktop environments and shells are available? | Xmonad](https://askubuntu.com/a/871567/566421)
    
## Awesome

- Install:

		sudo apt install awesome
	
- Uninstall:
	
		sudo apt remove --purge awesome 
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - [What kinds of desktop environments and shells are available? | Awesome](https://askubuntu.com/a/124649/566421)
    
## Enlightenment

- Install:

		sudo apt install e17
	
- Uninstall:
	
		sudo apt remove --purge e17
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - [What kinds of desktop environments and shells are available? | Enlightenment](https://askubuntu.com/a/65577/566421)
    - [How do I install Enlightenment (E17)?](https://askubuntu.com/questions/16932/how-do-i-install-enlightenment-e17)
    
## i3wm

- Install:

		sudo apt install i3
	
- Uninstall:
	
		sudo apt-get remove --auto-remove --purge i3-wm
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - [What kinds of desktop environments and shells are available? | i3wm](https://askubuntu.com/a/413187/566421)
    - [How To Uninstall i3-wm On Ubuntu 15.04](https://www.howtoinstall.co/en/ubuntu/utopic/i3-wm?action=remove)
    
## Qtile 

Available for 16.10+ - [here](http://docs.qtile.org/en/latest/manual/install/ubuntu.html).


## Deepin DE 

The PPA's from the following links don't work [**1**](https://askubuntu.com/a/342010/566421) and [**2**](https://www.youtube.com/watch?v=I3PTtM9VqcM).

## Openbox

- Install:

		sudo apt install openbox openbox-menu 
		#sudo apt install openbox-gnome-session openbox-kde-session
	
- Uninstall:
	
		sudo apt-get remove --purge openbox openbox-menu 
		#sudo apt-get remove --purge openbox openbox-gnome-session openbox-kde-session
		sudo apt update && sudo apt autoremove && sudo apt autoclean
		
- References:

    - [What kinds of desktop environments and shells are available? | Openbox](https://askubuntu.com/a/730191/566421)

## Trinity

- Install:

		echo | sudo tee -a /etc/apt/sources.list
		echo "# Trinity - https://askubuntu.com/a/286547/566421" | sudo tee -a /etc/apt/sources.list
		echo "deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-r14.0.0/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list
		echo "deb-src http://mirror.ppa.trinitydesktop.org/trinity/trinity-r14.0.0/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list
		echo "deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-builddeps-r14.0.0/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list
		echo "deb-src http://mirror.ppa.trinitydesktop.org/trinity/trinity-builddeps-r14.0.0/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list
		
		sudo apt update && sudo apt upgrade
		sudo apt install kubuntu-default-settings-trinity kubuntu-desktop-trinity
		
		#sudo apt-get install kubuntu-default-settings-trinity kubuntu-desktop-trinity --fix-missing
		
	
- Uninstall:
	
		sudo apt-get remove --purge kubuntu-default-settings-trinity kubuntu-desktop-trinity 
		# Remove PPA from /etc/apt/sources.list
		sudo apt update && sudo apt autoremove && sudo apt autoclean
		
- References:

    - [What kinds of desktop environments and shells are available? | Trinity](https://askubuntu.com/a/286547/566421)
    - [Trinity Desktop Project Wiki : **Ubuntu Trinity Repository** Installation Instructions](https://wiki.trinitydesktop.org/UbuntuInstall)
    
## Budgie

- Install 17.04+:

		sudo apt install ubuntu-budgie-desktop
		
- Install 16.04:

		sudo add-apt-repository ppa:budgie-remix/ppa
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F422D205
		sudo apt update
		sudo apt install budgie-desktop
			
- Uninstall:
	
		sudo apt-get remove --purge ubuntu-budgie-desktop 
		sudo apt install ppa-purge 
		sudo ppa-purge ppa:budgie-remix/ppa
		sudo apt update && sudo apt autoremove && sudo apt autoclean
		
- References:

    - [What kinds of desktop environments and shells are available? | Budgie](https://askubuntu.com/a/753467/566421)
    - [Solus Budgie](https://solus-project.com/download/)

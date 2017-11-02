# Desctop environments installation

## Gnome Shell | Ubuntu Gnome Desktop

- Install

		sudo apt update
		sudo apt install ubuntu-gnome-desktop
		
- Uninstall 

		sudo apt remove --purge ubuntu-gnome-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - https://askubuntu.com/questions/766071/install-gnome-shell-on-ubuntu-16-04
    - https://askubuntu.com/questions/781559/using-gnome-in-ubuntu-16-04-lts

## XFCE4 | XUbuntu Desktop

- Install

		sudo apt update
		sudo apt-get install xubuntu-desktop
		# sudo apt-get install xfce4
		
- Uninstall 

		sudo apt remove --purge xubuntu-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - https://askubuntu.com/questions/223536/how-can-i-install-xfce-along-side-unity
    - https://askubuntu.com/questions/65861/how-to-i-change-from-ubuntu-to-xubuntu
    - [Desctop Icons Recovery 1](https://askubuntu.com/questions/451847/desktop-icons-not-showing-up-in-xubuntu-and-i-cant-right-click-on-the-desktop) | [Desctop Icons Recovery 2](https://bbs.archlinux.org/viewtopic.php?id=127138) 

## LXDE | Lubuntu Desktop (Lubuntu Netbook)

- Install

		sudo apt update
		sudo apt-get install lubuntu-desktop
		# sudo apt-get install lxde
		
- Uninstall 

		sudo apt remove --purge lubuntu-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - https://www.howtogeek.com/107368/how-to-install-the-lightweight-lxde-desktop-on-ubuntu/
    
## Mate | Ubuntu Mate
		
- Innstall Mate from PPA

		sudo add-apt-repository ppa:jonathonf/mate-1.18
		#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8CF63AD3F06FC659
		sudo apt update && sudo apt full-upgrade
		sudo apt update && sudo apt install mate-core mate-desktop-environment
		sudo apt install --install-suggests mate-desktop
	
- Uninstall:
	
		sudo apt install ppa-purge 
		sudo ppa-purge ppa:jonathonf/mate-1.18
		sudo apt update && sudo apt autoremove && sudo apt autoclean


- Alternativelly Install Ubuntu Mate Desktop

		sudo apt install ubuntu-mate-desktop
		sudo apt install ubuntu-mate-core ubuntu-mate-desktop
		
- References:

    - http://tipsonubuntu.com/2017/03/15/install-mate-desktop-1-18-in-ubuntu-16-04/
    - http://tipsonubuntu.com/2016/09/23/install-mate-desktop-1-16-ubuntu-16-04/
    - https://ubuntu-mate.org/blog/mate-desktop-116-for-xenial-xerus/
    - https://askubuntu.com/questions/87040/how-do-i-install-mate-the-desktop-environment
    
## Cinnamon Desktop (Mint) | Cinnamon2d | Cinnamon (Software Rendering)

- Innstall

		udo add-apt-repository ppa:embrosyn/cinnamon
		#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys XXXXX
		sudo apt update && sudo apt upgrade
		sudo apt-get install cinnamon
	
- Uninstall:
	
		sudo apt install ppa-purge 
		sudo ppa-purge ppa:embrosyn/cinnamon
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - https://www.tecmint.com/install-cinnamon-desktop-in-ubuntu-fedora-workstations/


## KDE Plasma | Kubuntu 

- Innstall
		sudo apt-get install kubuntu-desktop
		# Recovery
		sudo dpkg -i --force-overwrite  /var/cache/apt/archives/kde-config-telepathy-accounts_4%3a15.12.3-0ubuntu1_amd64.deb
		sudo apt-get install -f
	
- Uninstall:
	
		sudo apt remove --purge kubuntu-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean
	
- References:

    - https://askubuntu.com/questions/764542/help-installing-kubuntu-desktop-on-ubuntu-16-04
    - https://askubuntu.com/questions/768786/unable-to-install-kubuntu-desktop-in-ubuntu-16-04-lts
    
# Ubuntu Desktop Recovery

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

- [Show the desctop icons and the background image](https://ubuntuforums.org/showthread.php?t=2246432), and eanable the right lick on the desktop **after XFCE** installation:

		gsettings set org.gnome.desktop.background show-desktop-icons true

- References:

    - [**Restore Unity Greeter**](https://askubuntu.com/a/550404/566421)
    - [**How do I change the wallpaper of the login screen?**](https://askubuntu.com/questions/64001/how-do-i-change-the-wallpaper-of-the-login-screen)
    - [**How do I set the LightDM wallpaper in Ubuntu 14.04?**](https://askubuntu.com/questions/449677/how-do-i-set-the-lightdm-wallpaper-in-ubuntu-14-04)
    - https://askubuntu.com/questions/58023/how-can-i-make-lightdm-the-default-display-manager
    - https://askubuntu.com/questions/715108/how-to-purge-sddm-plasma-completely
    - https://askubuntu.com/questions/95458/how-do-i-reinstall-unity
    - [How to Choose & Switch Linux Display Managers](http://www.makeuseof.com/tag/choose-switch-linux-display-managers/) 

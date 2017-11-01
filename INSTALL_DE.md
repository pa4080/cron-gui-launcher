## Desctop environments installation

### Gnome Shell | Ubuntu Gnome Desktop

- Install

		sudo apt update
		sudo apt install ubuntu-gnome-desktop
		
- Uninstall 

		sudo apt remove --purge ubuntu-gnome-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - https://askubuntu.com/questions/766071/install-gnome-shell-on-ubuntu-16-04
    - https://askubuntu.com/questions/781559/using-gnome-in-ubuntu-16-04-lts

### XFCE4 | XUbuntu Desktop

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

### LXDE | Lubuntu Desktop (Lubuntu Netbook)

- Install

		sudo apt update
		sudo apt-get install lubuntu-desktop
		# sudo apt-get install lxde
		
- Uninstall 

		sudo apt remove --purge lubuntu-desktop
		sudo apt update && sudo apt autoremove && sudo apt autoclean

- References:

    - https://www.howtogeek.com/107368/how-to-install-the-lightweight-lxde-desktop-on-ubuntu/
    
### Mate | Ubuntu Mate
		
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
    
### Cinnamon Desktop (Mint) | Cinnamon2d | Cinnamon (Software Rendering)

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
    	
### Recovery from some issues

- Chande the window manager

		sudo dpkg-reconfigure lightdm 		
		# sudo dpkg-reconfigure gdm3

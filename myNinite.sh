#First of all. Update everything
dnf update -y


#Gnome extension Native Host Connector
dnf install -y chrome-gnome-shell

#GNOME Tweak Tool
dnf install -y gnome-tweak-tool


# Sublime text
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf -y config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo 
dnf -y install sublime-text

#TeamViewer
#wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
#dnf -y install teamviewer.x86_64.rpm

#Discord
dnf copr enable tcg/discord -y
dnf install Discord-installer -y
systemctl enable --now discord-installer

#Simple Screen Recorder
rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
dnf install -y simplescreenrecorder

#smplayer
dnf install -y smplayer 

#flameshot
dnf -y install flameshot


#Anydesk
cat > /etc/yum.repos.d/AnyDesk-Fedora.repo << "EOF" 
[anydesk]
name=AnyDesk Fedora - stable
baseurl=http://rpm.anydesk.com/fedora/$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF

dnf install -y anydesk


#SimpleScreenRecorder
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install simplescreenrecorder

#Reset media shortcuts(Use this for flameshot to ptr Scr shortcut)
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < keybindings-media-keys.dconf

echo "In order to install gnome shell etensions you need to restart"
echo "TO-DO"
echo "1.Add flameshot to printscreen shortcut. command is 'flameshot gui'"
echo "2.Go to http://extension.gnome.org and install 'miniview' and 'workspace isolation'"
#First of all. Update everything
dnf update -y



#INSTALL PACKAGES


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

#SETTINGS
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < keybindings-media-keys.dconf



#GNOME SHELL EXTESNIONS

extensionDir=~/.local/share/gnome-shell/extensions



#miniview gnome shell extension
wget https://github.com/iamlemec/miniview/archive/master.zip
uuid=$(unzip -c master.zip miniview-master/metadata.json |grep uuid| cut -d \" -f4)

mkdir -p  $extensionDir/$uuid
unzip -q $(pwd)/master.zip miniview-master/* -d $extensionDir/$uuid
mv $extensionDir/$uuid/miniview-master/* $extensionDir/$uuid/miniview-master/../
rm -Rf $extensionDir/$uuid/miniview-master/
gnome-extensions enable $uuid
rm master.zip




#isolated Workspaces extension

wget https://github.com/N-Yuki/gnome-shell-extension-workspace-isolated-dash/archive/master.zip
uuid=$(unzip -c master.zip gnome-shell-extension-workspace-isolated-dash-master/workspace-isolated-dash/metadata.json |grep uuid| cut -d \" -f4);echo $uuid
mkdir -p  $extensionDir/$uuid
unzip -q $(pwd)/master.zip gnome-shell-extension-workspace-isolated-dash-master/workspace-isolated-dash/* -d $extensionDir/$uuid
mv $extensionDir/$uuid/gnome-shell-extension-workspace-isolated-dash-master/workspace-isolated-dash/* $extensionDir/$uuid/gnome-shell-extension-workspace-isolated-dash-master/workspace-isolated-dash/../../
rm -Rf $extensionDir/$uuid/gnome-shell-extension-workspace-isolated-dash-master/
gnome-extensions enable $uuid
rm master.zip


echo "Log out and Log in to activate extesnios"
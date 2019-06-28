# Update X resource database
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Unify clipboard
if [ -x /usr/bin/autocutsel ]; then 
    #this will keep the clipboard in sync 
    #   with the primary buffer 
    autocutsel -selection CLIPBOARD -fork
    #this will keep the primary in sync 
    #   with the clipboard buffer 
    autocutsel -selection PRIMARY -fork 
fi

# Enable qt5 to support GTK+
QT_STYLE_OVERRIDE=GTK+
export QT_STYLE_OVERRIDE

# GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# fcitx settings
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

# gnome/qt hidpi settings
# export GDK_SCALE=1.5
# export GDK_DPI_SCALE=0.5
# export QT_AUTO_SCREEN_SCALE_FACTOR=1.5
# xrandr --dpi 220
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# display issue
# dbus-update-activation-environment --all
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# Set touchpad speed to 0.8 instead of 0
xinput set-prop 'DELL07E6:00 06CB:76AF Touchpad' 'libinput Accel Speed' 0.8

# Enable touchpad tapping
xinput set-prop 'DELL07E6:00 06CB:76AF Touchpad' 'libinput Tapping Enabled' 1

# Remap keys
xmodmap ~/.Xmodmap

# Start openbox
exec openbox-session

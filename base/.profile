export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

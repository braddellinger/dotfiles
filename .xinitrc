[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

session=${1:-i3}
case $session in
    i3    ) exec i3 ;;
    gnome ) exec gnome-session ;;
    *     ) exec $1 ;;
esac

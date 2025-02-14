#Get parent process ID
PID="$(ps | awk 'NR==2{print $1}')"
#Opens kitty detached so it's not a child process
<<<<<<< Updated upstream
# $HOME/.local/kitty.app/bin/kitty --detach --start-as fullscreen
$HOME/.local/ghostty.AppImage
=======
$HOME/.local/kitty.app/bin/ghostty --detach --start-as fullscreen
>>>>>>> Stashed changes
#Closes the process that opened kitty
kill -9 $PID

# by mloureir (tha l3g3nd)

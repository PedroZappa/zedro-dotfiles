#!/bin/bash
# start|stop screencast

set -o errexit
set -o pipefail

PIDFILE="${HOME}/.screencast.pid"
OUTFILE="/tmp/out.avi"
FINALFILE="${HOME}/Videos/ScreenCasts/screencast--$(date +'%Y-%m-%d--%H-%M-%S').avi"

# check if this script is already running
if [ -s $PIDFILE ] && [ -d "/proc/$(cat $PIDFILE)" ]; then

    # send SIG_TERM to screen recorder
    kill $(cat $PIDFILE)

    # clear the pidfile
    rm $PIDFILE

    # move the screencast into the user's video directory
    mv $OUTFILE $FINALFILE
else
    # screen resolution
    SCREENRES=$(xrandr -q --current | grep '*' | awk '{print$1}')

    # write to the pidfile
    echo $$ > $PIDFILE &&

    # let the recording process take over this pid
    exec ffmpeg \
      -f pulse \
      -i default \
      -ac 2 \
      -acodec vorbis \
      -f x11grab \
      -r 25 \
      -s ${SCREENRES} \
      -i :0.0 \
      -vcodec libx264 ${OUTFILE}
fi

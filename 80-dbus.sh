#!/bin/sh

# launches a session dbus instance, unless already started by the known user sv

[ -S "${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/bus" ] && return 0

dbuslaunch="$(command -v dbus-launch)"
if [ -n "$dbuslaunch" ] && [ -x "$dbuslaunch" ] && [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    if [ -n "$command" ]; then
        command="$dbuslaunch --exit-with-session $command"
    else
        eval " $($dbuslaunch --sh-syntax --exit-with-session)"
    fi
fi

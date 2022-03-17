#!/usr/bin/zsh

# Check necessary commands are installed...
if ! command -v tmux
then
        echo >&2 "Tmux not installed"
        exit 1
fi

if ! command -v tmuxinator
then
        echo >&2 "Tmuxinator not installed"
        exit 1
fi

start_work () {
        read "WORK?Start work? (y/n) "
        if [[ "$WORK" = 'y' ]]
        then
                # If work is already running, then tmuxinator will attach, not relaunch
                # So do not need to check for existence
                tmuxinator work
        else
                tmux new-session
        fi
}

attach_to () {
        NAME=${1:-"0"}
        while ! tmux attach-session -t "$NAME" &> /dev/null
        do
                echo "Not a valid sessison!"
                read "NAME?Attach to session: "
        done
}

if [[ -z "$TMUX" ]] && [[ $UID -ne 0 ]]
then
        if tmux list-session 2> /dev/null
        then
                # tmux ls succeeds if a session exists...
                echo "Type a session name to attach or 'new' for a new session."
                read "SESSION?"
                if [[ "$SESSION" = 'new' ]]
                then 
                        # Check whether to start work
                        start_work 
                else
                        # Or attach to an existing
                        attach_to "$SESSION"
                fi
        else
                # ...and errors if one does not
                start_work
        fi
fi

#!/usr/bin/zsh

if [[ -z $TMUX ]] && [[ ${UID} -ne 0 ]]
then
        read "NEW_SESSION?Start a new TMUX session? (Leave blank to skip) "
        tmux list-session
        if [[ $? -eq 0 ]] && [[ -z $NEW_SESSION ]]
        then
                echo ""
                read "name?Attach to session: "
                tmux attach-session -t $name > /dev/null 2>&1
                while [[ $? -ne 0 ]]
                do
                        echo "Not a valid sessison!"
                        echo ""
                        read "name?Attach to session: "
                        tmux attach-session -t $name
                done
        else
                tmux new-session
        fi
fi

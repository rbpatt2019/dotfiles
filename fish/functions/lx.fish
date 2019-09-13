function lx
        if set -q argv[1]
                command ls "$argv" -X --color --group-directories-first
        else
                command ls -X --color --group-directories-first
        end
end

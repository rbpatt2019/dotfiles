function fish_mode_prompt
        switch $fish_bind_mode
                case default
                        set_color white
                        echo '[N]'
                case insert
                        set_color blue
                        echo '[I]'
                case replace_one
                        set_color green
                        echo '[R]'
                case visual
                        set_color purple
                        echo '[V]'
                case '*'
                        set_color red
                        echo '[?]'
        end
        set_color normal
end

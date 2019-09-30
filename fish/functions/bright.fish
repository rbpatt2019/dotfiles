function bright -a direction bright -d "Changes brightness on Intel backlight systems"
        set -l max (cat /sys/class/backlight/intel_backlight/max_brightness)
        set -l min (math "0.05*$max")
        set -l step (math "$bright*$max")
        set -l current (cat /sys/class/backlight/intel_backlight/actual_brightness)
        switch $direction
                case 'up'
                        if test (math "$step+$current") -gt $max
                                echo $max | tee /sys/class/backlight/intel_backlight/brightness
                        else
                                echo (math "$step+$current") | tee /sys/class/backlight/intel_backlight/brightness
                        end
                case 'down'
                        if test (math "$current-$step") -le $min
                                echo $min | tee /sys/class/backlight/intel_backlight/brightness
                        else
                                echo (math "$current-$step") | tee /sys/class/backlight/intel_backlight/brightness
                        end
        end
end

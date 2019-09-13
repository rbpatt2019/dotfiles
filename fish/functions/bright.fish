function bright -a bright -d "Changes brightness on Intel backlight systems"
        set -l max (cat /sys/class/backlight/intel_backlight/max_brightness)
        set -l min  (math "0.05*$max")
        if test $bright -gt $max
                echo "Brightness cannot exceed $max"
        else if test $bright -le $min
                echo "I wouldn't do that if I were you..."
        else
                echo $bright | sudo tee /sys/class/backlight/intel_backlight/brightness
        end
end

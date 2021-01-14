if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0282828" #black
    echo -en "\e]P1cc241d" #red
    echo -en "\e]P298971a" #green
    echo -en "\e]P3d79921" #yellow
    echo -en "\e]P4458588" #blue
    echo -en "\e]P5b16286" #purple
    echo -en "\e]P6689d6a" #aqua
    echo -en "\e]P7a89984" #lightgrey
    echo -en "\e]P8928374" #darkgrey
    echo -en "\e]P9fb4934" #br-red
    echo -en "\e]PAb8bb26" #br-green
    echo -en "\e]PBfabd2f" #br-yellow
    echo -en "\e]PC83a598" #br-blue
    echo -en "\e]PDd3869b" #br-magenta
    echo -en "\e]PE8ec07c" #br-aqua
    echo -en "\e]PFebdbb2" #white
    clear #for background artifacting
    setfont Lat2-TerminusBold32x16
fi

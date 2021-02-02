if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0073642" #black
    echo -en "\e]P1dc322f" #red
    echo -en "\e]P2859900" #green
    echo -en "\e]P3b58900" #yellow
    echo -en "\e]P4268bd2" #blue
    echo -en "\e]P5d33682" #magenta
    echo -en "\e]P62aa198" #cyan
    echo -en "\e]P7eee8d5" #white
    echo -en "\e]P8002b36" #darkgrey
    echo -en "\e]P9cb4b16" #br-red
    echo -en "\e]PA586e75" #br-green
    echo -en "\e]PB657b83" #br-yellow
    echo -en "\e]PC839496" #br-blue
    echo -en "\e]PD6c71c4" #br-magenta
    echo -en "\e]PE93a1a1" #br-cyan
    echo -en "\e]PFfdf6e3" #br-white
    clear #for background artifacting
    setfont Lat2-TerminusBold32x16
fi

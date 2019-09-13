function dot
        mv "$argv" "$HOME/dotfiles"
        ln -s "$HOME/dotfiles/$argv" "$argv"
end

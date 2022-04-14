if [ -n "$d" ]; then
        export LS_COLORS=$(vivid generate ~/.config/vivid/themes/molokai-custom-dark)
else
        export LS_COLORS=$(vivid generate ~/.config/vivid/themes/molokai-custom-light)
fi

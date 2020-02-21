#set -g PATH /usr/bin /usr/local/bin /usr/local/sbin /usr/lib/jvm/default/bin /opt/android-sdk/platform-tools /opt/android-sdk/tools /opt/android-sdk/tools/bin $PATH

set -g fish_greeting "" 
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user no
set SHELL /usr/bin/fish

# Start X11 at startup 
#if status is-interactive
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx -- -keeptty
#    end
#end

#Fisher update
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

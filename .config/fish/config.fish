source /opt/homebrew/opt/asdf/libexec/asdf.fish
if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_color_command brblue --bold
    abbr --add v nvim
    abbr --add g git
    abbr --add c commit
    abbr --add a asdf
    abbr --add r rails
    abbr --add s status
    abbr --add sw swich
    abbr --add ch checkout

    eval (direnv hook fish)
end

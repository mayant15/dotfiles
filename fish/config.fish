if status is-interactive
  abbr -a gco git checkout
  abbr -a ga git add
  abbr -a gl "git log --oneline"
  abbr -a gcm "git commit -m"
  abbr -a gco "git checkout"
  abbr -a gs "git status"
  abbr -a lg "lazygit"

  abbr -a to "~/code/dotfiles/tmux-sessionizer"
  abbr -a tm "tmux"
  abbr -a tl "tmux ls"
  abbr -a ta "tmux attach"

  abbr -a jo "j open"
  abbr -a jt "j tasks"
  abbr -a jh "j tasks hold"
  abbr -a ja "j tasks todo"

  fish_config theme choose "rose-pine"

  mise activate fish | source
end


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/mayantm/.opam/opam-init/init.fish' && source '/home/mayantm/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

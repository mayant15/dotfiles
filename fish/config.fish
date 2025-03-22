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

  fish_config theme choose "rose-pine"
  mise activate fish | source
end

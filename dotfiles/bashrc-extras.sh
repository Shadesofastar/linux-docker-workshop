# Append this file to your ~/.bashrc and reload it:
# cat dotfiles/bashrc-extras.sh >> ~/.bashrc && source ~/.bashrc

export PS1="\[\e[1;35m\]\u\[\e[0m\] \[\e[1;36m\]\w\[\e[0m\] $ "
alias ll='ls -lah --color=auto'
if command -v fastfetch >/dev/null; then fastfetch; elif command -v neofetch >/dev/null; then neofetch; fi

# Check system update
alias checkupd='dnf updateinfo list'
alias checkbug='dnf updateinfo list --bugfix'
alias checksec='dnf updateinfo list --security'
alias checkenhance='dnf updateinfo list --enhancement'

# Check system repo, ports & etc
alias repolist='dnf repolist'
alias portopen='sudo netstat -tulpn'

# Sudo & systemctl
alias visudo='sudo visudo'
alias reboot='sudo reboot'
alias powoff='sudo poweroff'

# End with RC
alias rcload='source ~/.bashrc'
alias rcedit='vim ~/.bashrc'
alias rcalias='vim ~/.bash_aliases'
alias rcsafe='vim ~/.bash_safety'
alias rcvim='vim ~/.vimrc'
alias rcfunc='vim ~/.bash_functions'

# DNF package
alias updatepkg='sudo dnf update'
alias upgradepkg='sudo dnf upgrade'
alias searchpkg='dnf search'
alias infopkg='dnf info'
alias instapkg='sudo dnf install'
alias removepkg='sudo dnf remove'
alias howmanypkg='dnf list --installed'

# Tools
alias spdcli='speedtest-cli'
alias gcl='git clone'
alias gst='git status'
alias gad='git add'
alias gcm='git commit'
alias gph='git push -u origin main'

# Docker
alias doimage='docker image ls'
alias dops='docker ps -a'
alias dorun='docker run'

# Text editor
alias vi='vim'

# Misc
alias cls='clear'

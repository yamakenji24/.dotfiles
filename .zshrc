export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#色を付ける
autoload colors
autoload -Uz vcs_info
colors

alias emacs='emacs -nw'
alias ls='ls -a'

setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}"
zstyle ':vcs_info:git:*' unstagedstr "%F{blue}"
zstyle ':vcs_info:*' formats "%F{green}%c%u \ue0a0[%b-branch]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

chpwd() { ls -a --color=auto }

#左側にカレントディレクトリを表示する

PROMPT='$(left-prompt-top)
$(left-prompt-middle) '
ipcolor="magenta"
usernamecolor="green"
currentpathcolor="cyan"
gitbranchcolor="black"
gitcolor="white"
shellcolor="white"
rubycolor="red"
gcccolor="blue"
python3color="yellow"
arrow="\ue0b0"
left-prompt-top() {
  echo "$(ip-view)%K{${usernamecolor}}%F{${ipcolor}}${arrow}%f$(username-view)%k%F{${usernamecolor}}%K{${currentpathcolor}}${arrow}%f $(current-path-view)%F{${currentpathcolor}}%K{${gitbranchcolor}}${arrow}%f$(git-branch-view)%k%F{${gitbranchcolor}}${arrow}%f"
}
left-prompt-middle() {
  echo "$(shell-view)%F{${shellcolor}}%K{${rubycolor}}${arrow}%f$(ruby-version-view)%k%F{${rubycolor}}%K{${gcccolor}}${arrow}%f$(gcc-version-view)%k%F{${gcccolor}}${arrow}%f$(python3-version-view)%k%F{${python3color}}${arrow}%k%F{${gitcolor}}"
}
ip-view() {
    echo "%K{${ipcolor}}%F{white}$(ifconfig | grep -w "inet" | grep -v "127.0.0.1" | cut -f 2 -d ' ')%f%k"
}
username-view() {
  echo "%K{${usernamecolor}}%F{black}  [%n] %f%k"
}
current-path-view() {
  echo "%K{${currentpathcolor}}%F{black}%d%f%k"
}
git-branch-view() {
    if [[ -z ${vcs_info_msg_0_} ]]; then
	    echo '%F{white} \ue0a0 [no-branch]%f'
    else
        echo " ${vcs_info_msg_0_}"
    fi
}
shell-view() {
  echo "%K{${shellcolor}}%F{black}$(echo $SHELL | rev | cut -f 1 -d "/" | rev)%f%k"
}
ruby-version-view() {
  echo "%K{${rubycolor}}%F{black}  Ruby $(rbenv version | cut -f 1 -d ' ')%f%k"
}
gcc-version-view() {
  echo "%K{${gcccolor}}%F{white}  gcc $(gcc -dumpversion)%f%k"
}
python3-version-view() {
  echo "%K{${python3color}}%F{black}  python $(python3 -V | cut -f 2 -d " ")%f%k"
}

# lsに色を付けます

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls="ls -GF"
        ;;
    linux*)
        alias ls="ls -F --color"
        ;;
esac

precmd() { vcs_info }

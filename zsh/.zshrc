#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias caen="sshpass -p 'W1ldtigerf!r' ssh kevzheng@login.engin.umich.edu "
alias ..="cd .."
alias meme="markov ~/coding/personal/markov/memes.csv 100"

. `brew --prefix`/etc/profile.d/z.sh
#source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

screenfetch -E


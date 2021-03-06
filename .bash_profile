#source ~/.profile

#FINDER Fix
#alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

#export PATH=$PATH:/opt/vm_snapshots/ops/scripts/linux/bash/gen-collection

#ruby / jekyll
export PATH=/usr/local/bin:$PATH

#Hide Computer Name
#export PS1="\u:\w \$"
#export PS1="\[\e]2;\u@\H \w\a\e[32;1m\]>\[\e[0m\] "
#export PS1="\[\e[34;40m\]\u:\[\e[32;1m\]\W>\[\e[0m\]\!\$ "

 #Java
#export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
#export PATH=$JAVA_HOME/bin:$PATH
#export PATH=$PATH:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/lib
#export PATH=$PATH:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib

# Maven
#export M2_HOME=/Applications/apache-maven-3.3.9/
export M2_HOME=/Applications/apache-maven-3.0.5/
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms512m -Xmx1536m"
export PATH=$M2:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$PATH


alias ll="ls -al"
# startup virtualenv-burrito
#if [ -f $HOME/.venvburrito/startup.sh ]; then
#    . $HOME/.venvburrito/startup.sh
#fi

alias copymusic='python ~/Dev/Jonezy/Music2Usb/copymusic.py'
alias copyplaylists='python ~/Dev/Jonezy/Music2Usb/copyPlayLists.py'

# NVM Info
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# OpenJDK
export PATH=/Applications/jdk8u202-b08/Contents/Home/bin:$PATH


######### dotfiles contribution:

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
# for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
# shopt -s histappend;

# Autocorrect typos in path names when using `cd`
# shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
# complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

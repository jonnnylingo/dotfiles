export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home

gradle-run () {
    local gradle_cmd
    export TZ="UTC"
    gradle_cmd="$(find-upward gradlew)"
    if [[ ! -f "${gradle_cmd}" ]]
    then
        gradle_cmd="gradle"
    fi
    "${gradle_cmd}" "$@"
}
alias gradle=gradle-run
 
find-upward () {
    [[ -z "$1" ]] && return 1
    local name dir
    name="$1"
    dir="${PWD}"
    while [[ "${dir}" != "" ]] && [[ ! -e "${dir}/$name" ]]
    do
        dir="${dir%/*}"
    done
    if [[ -e "${dir}/$name" ]]
    then
        echo "${dir}/$name"
        return 0
    fi
    return 2
}

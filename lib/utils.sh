check_cmd() {
    if [ ! "$(command -v "$1")" ]; then
        app=$1
        redprint "It seems like you don't have ${app}."
        redprint "Please install ${app}."
        exit 1
    fi
}

# bash version check
check_bash() {
    # If you are using Bash, check Bash version
    if ((BASH_VERSINFO[0] < $1)); then
        printf '%s\n' "Error: This requires Bash v${1} or higher. You have version $BASH_VERSION." 1>&2
        exit 2
    fi
}

### Colors ##
ESC=$(printf '\033')
RESET="${ESC}[0m"
BLACK="${ESC}[30m"
RED="${ESC}[31m"
GREEN="${ESC}[32m"
YELLOW="${ESC}[33m"
BLUE="${ESC}[34m"
MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m"
WHITE="${ESC}[37m"
DEFAULT="${ESC}[39m"

### Color Functions ##

blackprint() {
    printf "${BLACK}%s${RESET}\n" "$1"
}

blueprint() {
    printf "${BLUE}%s${RESET}\n" "$1"
}

cyanprint() {
    printf "${CYAN}%s${RESET}\n" "$1"
}

defaultprint() {
    printf "${DEFAULT}%s${RESET}\n" "$1"
}

greenprint() {
    printf "${GREEN}%s${RESET}\n" "$1"
}

magentaprint() {
    printf "${MAGENTA}%s${RESET}\n" "$1"
}

redprint() {
    printf "${RED}%s${RESET}\n" "$1"
}

whiteprint() {
    printf "${WHITE}%s${RESET}\n" "$1"
}

yellowprint() {
    printf "${YELLOW}%s${RESET}\n" "$1"
}

# Text attribute
BOLD="${ESC}[1m"
FAINT="${ESC}[2m"
ITALIC="${ESC}[3m"
UNDERLINE="${ESC}[4m"
SLOWBLINK="${ESC}[5m"
SWAP="${ESC}[7m"
STRIKE="${ESC}[9m"

boldprint() {
    printf "${BOLD}%s${RESET}\n" "$1"
}

faintprint() {
    printf "${FAINT}%s${RESET}\n" "$1"
}

italicprint() {
    printf "${ITALIC}%s${RESET}\n" "$1"
}

underlineprint() {
    printf "${UNDERLINE}%s${RESET}\n" "$1"
}

slowblinkprint() {
    printf "${SLOWBLINK}%s${RESET}\n" "$1"
}

swapprint() {
    printf "${SWAP}%s${RESET}\n" "$1"
}

strikeprint() {
    printf "${STRIKE}%s${RESET}\n" "$1"
}


# lib/banners
# Usage: bannerSimple "my title" "*"
function bannerSimple() {
    msg="${2} ${1} ${2}"
    edge=$(echo "${msg}" | sed "s/./"${2}"/g")
    echo "${edge}"
    echo "$(tput bold)${msg}$(tput sgr0)"
    echo "${edge}"
    echo
}

# Usage: bannerColor "my title" "red" "*"
function bannerColor() {
    case ${2} in
    black)
        color=0
        ;;
    red)
        color=1
        ;;
    green)
        color=2
        ;;
    yellow)
        color=3
        ;;
    blue)
        color=4
        ;;
    magenta)
        color=5
        ;;
    cyan)
        color=6
        ;;
    white)
        color=7
        ;;
    *)
        echo "color is not set"
        exit 1
        ;;
    esac

    msg="${3} ${1} ${3}"
    edge=$(echo "${msg}" | sed "s/./${3}/g")
    tput setaf ${color}
    tput bold
    echo "${edge}"
    echo "${msg}"
    echo "${edge}"
    tput sgr 0
    echo
}
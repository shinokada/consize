# shellcheck disable=SC1083
parser_definition() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} [command] [options...] [arguments...]"
    msg -- '' 'Options:'
    disp :usage -h --help
    disp VERSION --version

    msg -- '' 'Commands: '
    msg -- 'Use command -h for a command help.'
    cmd cmd1 -- "CMD1 description."
    cmd cmd2 -- "CMD2 description."
    cmd text_example -- "Print different type of texts."
    cmd create -- "Create this and that."

    msg -- '' "Examples:
    
    cmd1 
    $SCRIPT_NAME cmd1
    cmd2 
    $SCRIPT_NAME cmd2
    text_example
    $SCRIPT_NAME text_example
    Display the version:
    $SCRIPT_NAME --version
    Display help:
    $SCRIPT_NAME -h | --help
"
}

# shellcheck disable=SC1083
parser_definition() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} [command] [options...] [arguments...]"
    msg -- '' 'Options:'
    disp :usage -h --help
    disp VERSION --version

    msg -- '' 'Commands: '
    msg -- 'Use command -h for a command help.'
    cmd png2webp -- "Convert to PNG to webp format."
    cmd img2png -- "Convert to JPG/PNG to webp format."
    cmd resize -- "Resize all webp images."

    msg -- '' "Examples:
    
    jpg2webp
    $SCRIPT_NAME jpg2webp -d .
    png2webp
    $SCRIPT_NAME png2webp -d .
    text_example
    $SCRIPT_NAME text_example
    Display the version:
    $SCRIPT_NAME --version
    Display help:
    $SCRIPT_NAME -h | --help
"
}

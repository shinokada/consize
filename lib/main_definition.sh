# shellcheck disable=SC1083
parser_definition() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} [command] [options...] [arguments...]"
    msg -- '' 'Options:'
    disp :usage -h --help
    disp VERSION --version

    msg -- '' 'Commands: '
    msg -- 'Use command -h for a command help.'
    cmd png2webp -- "Convert to PNG to WEBP format."
    cmd jpg2png -- "Convert to JPG/JPEG to PNG format."
    cmd jpg2webp -- "Convert to JPG/JPEG to WEBP format."
    cmd img2webp -- "Convert to JPG/PNG to WEBP format."
    cmd resize -- "Resize all webp images."

    msg -- '' "Examples:
    
    img2webp
    $SCRIPT_NAME img2webp -d . -q 90
    png2webp
    $SCRIPT_NAME png2webp -d . -q 90
    resize
    $SCRIPT_NAME png2webp -d . -w 540 -h 230
    Display the version:
    $SCRIPT_NAME --version
    Display help:
    $SCRIPT_NAME -h | --help
"
}

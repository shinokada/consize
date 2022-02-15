# shellcheck disable=SC1083
parser_definition() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} [command] [options...] [arguments...]"
    msg -- '' 'Options:'
    disp :usage -h --help
    disp VERSION --version

    msg -- '' 'Commands: '
    msg -- 'Use command -h for a command help.'
    cmd png2webp -- "Convert from PNG to WEBP files."
    cmd jpg2png -- "Convert from JPG/JPEG to PNG files."
    cmd jpg2webp -- "Convert from JPG/JPEG to WEBP files."
    cmd img2webp -- "Convert from JPG/PNG to WEBP files."
    cmd optimize_jpg -- "Optimize JPG/JPEG files."
    cmd optimize_png -- "Optimize PNG files."
    cmd optimize_svg -- "Optimize SVG files."
    cmd png2jpg -- "Convert from PNG to JPG files."
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

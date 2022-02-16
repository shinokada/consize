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
    cmd svg2jpg -- "Convert from SVG to JPG files."
    cmd svg2png -- "Convert from SVG to PNG files."
    cmd webp2jpg -- "Convert from WEBP to JPG files."
    cmd webp2png -- "Convert from WEBP to PNG files." 
    cmd resize -- "Resize all webp images."

    msg -- '' "Examples:

    img2webp
    $SCRIPT_NAME img2webp -d . -q 90
    jpg2png
    $SCRIPT_NAME jpg2png -d .
    jpg2webp
    $SCRIPT_NAME jpg2webp -d . -q 90
    optimize_jpg
    $SCRIPT_NAME optimize_jpg -d . -q 90
    optimize_png
    $SCRIPT_NAME optimize_png -d .
    optimize_svg
    $SCRIPT_NAME optimize_svg -d .
    png2jpg
    $SCRIPT_NAME png2jpg -d . -q 90
    png2webp
    $SCRIPT_NAME png2webp -d . -q 90
    resize
    $SCRIPT_NAME png2webp -d . -w 540 -h 230
    svg2jpg
    $SCRIPT_NAME svg2jpg -d . -w 540 -q 90
    svg2png
    $SCRIPT_NAME svg2png -d . -w 540
    webp2jpg
    $SCRIPT_NAME webp2jpg -d . -q 90
    webp2png
    $SCRIPT_NAME webp2png -d . 
    Display the version:
    $SCRIPT_NAME --version
    Display help:
    $SCRIPT_NAME -h | --help
"
}

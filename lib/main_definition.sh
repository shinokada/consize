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
    cmd resize -- "Resize all WEBP images."

    msg -- '' "Examples:
    -i has the default value of the current directory, ./
    -o has the default value of the current directory, ./
    -q has the default value of 100

    All image file to WEBP files:
    $SCRIPT_NAME img2webp 

    All JPG/JPEG files to PNG files, set input directory:
    $SCRIPT_NAME jpg2png -i path/to/input-dir

    All JPG/JPEG files to WEBP files, set output directory:
    $SCRIPT_NAME jpg2webp -o path/to/output-dir

    Optimize JPG/JPEG files, set input, output, and quality:
    $SCRIPT_NAME optimize_jpg -i path/to/input-dir -o path/to/output-dir -q 70
    
    Optimize PNG files:
    $SCRIPT_NAME optimize_png 

    Optimize SVG files: 
    $SCRIPT_NAME optimize_svg 

    All PNG files to JPG/JPEG files:
    $SCRIPT_NAME png2jpg 
    
    All PNG files to WEBP files:
    $SCRIPT_NAME png2webp 

    All PNG files to WEBP files and resize:
    $SCRIPT_NAME png2webp && $SCRIPT_NAME resize -w 540 -h 230
    
    All SVG files to JPG files and resize:
    $SCRIPT_NAME svg2jpg -w 540

    All SVG files to PNG files and resize:
    $SCRIPT_NAME svg2png -w 540

    All WEBP files to JPG files:
    $SCRIPT_NAME webp2jpg

    All WEBP files to PNG files:
    $SCRIPT_NAME webp2png 

    Display the version:
    $SCRIPT_NAME --version
    
    Display help:
    $SCRIPT_NAME -h | --help
"
}

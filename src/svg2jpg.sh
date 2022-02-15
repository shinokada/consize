fn_svg2jpg(){
    # directory containing images
    input_dir="$1"

    # jpg image width
    width="$2"

    # jpg image quality
    quality="$3"

    if [[ -z "$input_dir" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "$width" ]]; then
        echo "Please specify image width."
        exit 1
    elif [[ -z "$quality" ]]; then
        echo "Please specify image quality."
        exit 1
    fi

    # for each svg in the input directory
    for img in $( find $input_dir -type f -iname "*.svg" );
    do
        svgexport $img ${img%.*}.jpg $width: $quality%
    done
}
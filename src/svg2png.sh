fn_svg2png(){
    check_cmd svgexport

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    fi

    # for each svg in the input directory
    for img in $( find ${DIR} -type f -iname "*.svg" );
    do
        svgexport "$img" "${img%.*}".png "${WIDTH}":
    done

    bannerColor 'Completed converting svg files to png files.' "green" "*"

}
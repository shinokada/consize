fn_svg2jpg(){
    check_cmd svgexport

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    elif [[ -z "${QUALITY}" ]]; then
        echo "Please specify image quality."
        exit 1
    fi

    # for each svg in the input directory
    for img in $( find ${DIR} -type f -iname "*.svg" );
    do
        svgexport "$img" "${img%.*}".jpg "${WIDTH}px": "${QUALITY}%"
    done
}
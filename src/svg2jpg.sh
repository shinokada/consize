fn_svg2jpg(){
    check_cmd svgexport

    if [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    fi

    # for each svg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.svg" );
    do
        svgexport "$img" "${OUTPUTDIR}/${img%.*}".jpg "${WIDTH}": "${QUALITY}%"
    done

    bannerColor 'Completed converting svg files to jpg files.' "green" "*"

}
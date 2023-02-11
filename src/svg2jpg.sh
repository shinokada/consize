fn_svg2jpg(){
    check_cmd svgexport

    if [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    fi

    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p "${OUTPUTDIR}" 
    fi

    # for each svg in the input directory
    for img in $( find "${INPUTDIR}" -type f -iname "*.svg" );
    do
        if [ -n "${OUTPUTDIR}" ];then
            file_name=$(basename "$img")
            svgexport "$img" "${OUTPUTDIR}/${file_name%.*}".jpg "${WIDTH}": "${QUALITY}%" 2>&1 >/dev/null
        else
            svgexport "$img" "${img%.*}".jpg "${WIDTH}": "${QUALITY}%" 2>&1 >/dev/null
        fi
    done

    bannerColor 'Completed converting svg files to jpg files.' "green" "*"
}

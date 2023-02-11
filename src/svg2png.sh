fn_svg2png(){
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
            svgexport "$img" "${OUTPUTDIR}/${file_name%.*}".png "${WIDTH}": "${QUALITY}%" 2>&1 >/dev/null
        else
            svgexport "$img" "${img%.*}".png "${WIDTH}": "${QUALITY}%" 2>&1 >/dev/null
        fi
    done

    bannerColor 'Completed converting svg files to png files.' "green" "*"
}

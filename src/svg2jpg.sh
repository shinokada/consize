fn_svg2jpg(){
    check_cmd svgexport

    if [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    fi

    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi

    # for each svg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.svg" );
    do
        svgexport "$img" "${img%.*}".jpg "${WIDTH}": "${QUALITY}%" 2>&1 >/dev/null 

        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
            mv "${img%.*}".jpg "${OUTPUTDIR}"
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor 'Completed converting svg files to jpg files.' "green" "*"


}
fn_resize(){
    check_cmd convert

    if [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    elif [[ "${HEIGHT}" ]]; then
        DIMENSION="${WIDTH}x${HEIGHT}"
    else
        DIMENSION="${WIDTH}x"
    fi

    if [ -d "${INPUTDIR}/resized" ]; then
        rm -rf "${INPUTDIR}/resized"
    fi

    mkdir "${INPUTDIR}/resized"

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.webp" );
    do
        # resize first
        convert "${img}" -resize "${DIMENSION}" "${OUTPUTDIR}//resized/${img}"
    done

    bannerColor 'Completed resizing webp files.' "green" "*"

}
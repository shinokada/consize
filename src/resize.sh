fn_resize(){
    check_cmd convert

    CURRENT_DIR=$(pwd)

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
    bannerColor 'Resizing webp files ...' "blue" "*"
    for img in $( find "$CURRENT_DIR" -type f -iname "*.webp" );
    do
        # resize first
        bannerColor "Resizing ${img} with dimention: ${DIMENSION}" "green" "*"
        convert "${img}" -resize "${DIMENSION}" "${CURRENT_DIR}/resized/${img}"
    done

    bannerColor 'Completed resizing webp files.' "green" "*"

    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *.webp "${OUTPUTDIR}"
        bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
    fi
}
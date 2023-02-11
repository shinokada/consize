fn_resize(){
    check_cmd convert

    if [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    fi

    if [[ -z "${HEIGHT}" ]]; then
        DIMENSION="${WIDTH}"
    else
        DIMENSION="${WIDTH}x${HEIGHT}"
    fi

    if [[ -z "${OUTPUTDIR}" ]]; then
        echo "Please specify output directory."
        exit 1
    else
        mkdir -p "${OUTPUTDIR}"
    fi

    # for each image in the input directory
    bannerColor 'Resizing webp files ...' "blue" "*"
    for img in $(find "${INPUTDIR}" -type f \( -iname "*.webp" -o -iname "*.png" -o -iname "*.jpg" \));
    do
        # resize first
        bannerColor "Resizing ${img} with dimension: ${DIMENSION}" "green" "*"
        filename="$(basename "${img}")"
        extension="${filename##*.}"
        convert "${img}" -resize "${DIMENSION}" "${img%.*}-resized.${extension}"
        # move optimized png files
        bannerColor "Moving resized file to ${OUTPUTDIR}..." "blue" "*"
        mv "${img%.*}-resized.${extension}" "${OUTPUTDIR}/${filename%.*}-resized.${extension}"
        bannerColor "Done." "green" "*"
    done

    bannerColor 'Completed resizing webp files.' "green" "*"
}
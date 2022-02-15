fn_optimize_resize(){
    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    elif [[ -z "${HEIGHT}" ]]; then
        echo "Please specify image ."
        dimension="${WIDTH}x"
    else
        dimension="${WIDTH}x${HEIGHT}"
    fi

    mkdir "${DIR}/resized"

    # for each webp in the input directory
    for img in $( find ${DIR} -type f -iname "*.webp" );
    do
        # resize first
        convert "${img}" -resize "${dimension}" "${DIR}/resized/${img}"
    done

}
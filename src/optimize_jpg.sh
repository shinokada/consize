fn_optimize_jpg(){
    check_cmd jpegoptim

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "${QUALITY}" ]]; then
        echo "Please specify image quality."
        exit 1
    fi

    # for each jpg or jpeg in the input directory
    for img in $( find ${DIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        cp "$img" "${img%.*}"-optimized.jpg
        jpegoptim -m "${QUALITY}" "${img%.*}"-optimized.jpg
    done
}
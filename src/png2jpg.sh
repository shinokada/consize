fn_png2jpg(){
    check_cmd convert

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "${QUALITY}" ]]; then
        echo "Please specify image quality."
        exit 1
    fi

    # for each png in the input directory
    for img in $( find ${DIR} -type f -iname "*.png" );
    do
        convert "$img" -quality "${QUALITY}"% "${img%.*}".jpg
    done
}
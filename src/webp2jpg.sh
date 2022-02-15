fn_webp2jpg(){
    check_cmd dwebp
    check_cmd convert

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "${QUALITY}" ]]; then
        echo "Please specify image quality."
        exit 1
    fi

    # for each webp in the input directory
    for img in $( find ${DIR} -type f -iname "*.webp" );
    do
        # convert to png first
        dwebp "$img" -o "${img%.*}".png

        # then convert png to jpg
        convert "${img%.*}".png -quality "${QUALITY}"% "${img%.*}".jpg
    done
}
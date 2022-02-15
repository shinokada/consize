fn_img2webp(){
    . "${script_dir}/lib/utils.sh"
    check_cmd cwebp
    check_cmd convert

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "${QUALITY}" ]]; then
        echo "Please specify image quality."
        exit 1
    fi

    # for each png in the input directory convert to webp
    for img in $( find ${DIR} -type f -iname "*.png" );
    do
        cwebp "$img" -q "${QUALITY}" -o "${img%.*}".webp
    done

    # for each webp in the input directory convet to webp
    for img in $( find ${DIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        # convert to png first
        convert "$img" "${img%.*}".png

        # then convert png to webp
        cwebp "${img%.*}".png -q "${QUALITY}" -o "${img%.*}".webp
    done

}
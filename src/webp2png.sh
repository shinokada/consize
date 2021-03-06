fn_webp2png(){
    check_cmd dwebp

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    fi

    # for each webp in the input directory
    for img in $( find ${DIR} -type f -iname "*.webp" );
    do
        dwebp "$img" -o "${img%.*}".png
    done

    bannerColor 'Completed converting webp files to png files.' "green" "*"

}
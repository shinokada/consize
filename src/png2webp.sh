fn_png2webp(){

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
        cwebp $img -q ${QUALITY} -o ${img%.*}.webp
    done
}
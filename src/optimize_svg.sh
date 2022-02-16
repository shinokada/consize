fn_optimize_svg(){
    check_cmd svgo

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    fi

    # for each svg in the input directory
    for img in $( find ${DIR} -type f -iname "*.svg" );
    do
        svgo "$img" -o "${img%.*}"-optimized.svg
    done

    bannerColor 'Completed optimizing svg files.' "green" "*"

}
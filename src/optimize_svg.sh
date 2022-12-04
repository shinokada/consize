fn_optimize_svg(){
    check_cmd svgo

    # for each svg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.svg" );
    do
        svgo "$img" -o "${OUTPUTDIR}/${img%.*}"-optimized.svg
    done

    bannerColor 'Completed optimizing svg files.' "green" "*"

}
fn_optimize_svg(){
    check_cmd svgo

    # for each svg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.svg" );
    do
        svgo "$img" -o "${img%.*}"-optimized.svg
    done

    bannerColor 'Completed optimizing svg files.' "green" "*"
    
    # move optimized svg files
    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *-optimized.svg "${OUTPUTDIR}"
        bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
    fi
}
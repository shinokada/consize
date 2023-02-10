fn_optimize_svg(){
    check_cmd svgo
    
    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # for each svg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.svg" );
    do
        svgo "$img" -o "${img%.*}"-optimized.svg
    done

    bannerColor 'Completed optimizing svg files.' "green" "*"
    
    # move optimized svg files
    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mv *-optimized.svg "${OUTPUTDIR}"
        bannerColor "Done." "green" "*"
    fi
}
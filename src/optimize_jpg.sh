fn_optimize_jpg(){
    check_cmd jpegoptim

    # for each jpg or jpeg in the input directory
    # this will run recursively
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        cp "$img" "${img%.*}"-optimized.jpg
        jpegoptim -m "${QUALITY}" "${img%.*}"-optimized.jpg
    done

    bannerColor 'Completed optimizing jpg files.' "green" "*"
    
    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *-optimized.jpg "${OUTPUTDIR}"
        bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
    fi
}
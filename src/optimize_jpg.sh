fn_optimize_jpg(){
    check_cmd jpegoptim

    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # for each jpg or jpeg in the input directory
    # this will run recursively
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        cp "$img" "${img%.*}"-optimized.jpg
        jpegoptim -m "${QUALITY}" "${img%.*}"-optimized.jpg >/dev/null 2>&1 

        # move optimized jpg files
        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving optimized JPG files to ${OUTPUTDIR} ... " "blue" "*"
            mv "${img%.*}"-optimized.jpg "${OUTPUTDIR}" 2>&1 >/dev/null
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor 'Completed optimizing jpg files.' "green" "*"
    
}
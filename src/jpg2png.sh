fn_jpg2png(){
    check_cmd convert
    
    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # for each jpg or jpeg in the input directory
    # this is not intentionally recursive
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        convert "$img" "${img%.*}".png

        if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mv "${img%.*}".png "${OUTPUTDIR}"
        bannerColor "Done." "green" "*"
    fi
    done

    bannerColor 'Completed converting from JPG to PNG.' "green" "*"
}
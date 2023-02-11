fn_jpg2png(){
    check_cmd convert
    
    if [ -n ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # for each jpg or jpeg in the input directory
    # this is not intentionally recursive
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        if [ -n ${OUTPUTDIR} ];then
            convert "$img" "${OUTPUTDIR}/${img%.*}".png 
        else
            convert "$img" "${img%.*}".png 

        # if [ -n ${OUTPUTDIR} ];then
        # bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        # mkdir -p ${OUTPUTDIR} && mv "${img%.*}".png "${OUTPUTDIR}"
        # bannerColor "Moved all the PNG files to ${OUTPUTDIR}." "green" "*"
        fi
    done

    bannerColor 'Completed converting from JPG to PNG.' "green" "*"
}
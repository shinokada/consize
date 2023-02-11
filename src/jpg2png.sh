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
            file_name=$(basename "$img")
            convert "$img" "${OUTPUTDIR}/${file_name%.*}".png
        else
            convert "$img" "${img%.*}".png 
        fi
    done

    bannerColor 'Completed converting from JPG to PNG.' "green" "*"
}
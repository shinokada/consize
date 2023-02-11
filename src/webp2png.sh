fn_webp2png(){
    check_cmd dwebp
    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p ${OUTPUTDIR} 
    fi

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.webp" );
    do
        if [ -n "${OUTPUTDIR}" ];then
            file_name=$(basename "$img")
            dwebp "$img" -o "${OUTPUTDIR}/${file_name%.*}".png >/dev/null 2>&1
        else
            dwebp "$img" -o "${img%.*}".png >/dev/null 2>&1 
        fi
    done

    bannerColor 'Completed converting webp files to png files.' "green" "*"
}
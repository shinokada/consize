fn_webp2png(){
    check_cmd dwebp

    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.webp" );
    do
        dwebp "$img" -o "${img%.*}".png >/dev/null 2>&1 

        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
            mv "${img%.*}".png "${OUTPUTDIR}" >/dev/null
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor 'Completed converting webp files to png files.' "green" "*"
}
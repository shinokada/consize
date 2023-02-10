fn_png2jpg(){
    check_cmd convert
    
    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # for each png in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
    
        convert "$img" -quality "${QUALITY}"% "${img%.*}".jpg 2>&1 >/dev/null

        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
            mv ${img%.*}.jpg "${OUTPUTDIR}"
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor "Completed converting png files to jpg files." "green" "*"
}


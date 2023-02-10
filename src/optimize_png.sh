fn_optimize_png(){
    check_cmd optipng

    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi

    for img in $(find "${INPUTDIR}" -type f -iname "*.png"); do
        optipng "$img" -out "${img%.*}-optimized.png" >/dev/null 2>&1

        # move optimized png files
        if [ "${OUTPUTDIR}" ]; then
            bannerColor "Moving optimized PNG files to ${OUTPUTDIR}..." "blue" "*"
            mv "${img%.*}-optimized.png" "${OUTPUTDIR}" 2>&1 >/dev/null
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor 'Completed converting img files to webp files.' "green" "*"
    
}
fn_png2webp(){
    check_cmd cwebp
    
    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # for each png in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
        cwebp "$img" -q "${QUALITY}" -o "${img%.*}".webp >/dev/null 2>&1 

        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
            mv "${img%.*}".webp "${OUTPUTDIR}"
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor 'Completed converting png files to webp files.' "green" "*"

}
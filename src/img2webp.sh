fn_img2webp(){
    check_cmd cwebp
    check_cmd convert

    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # This will NOT recursively convert. Only files in the INPUTDIR.

    # for each png in the input directory convert to webp
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
        cwebp "$img" -q "${QUALITY}" -o "${img%.*}".webp >/dev/null 2>&1 

        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
            mv "${img%.*}".webp "${OUTPUTDIR}"
            bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
        fi
    done

    # for each jpg or jpeg in the input directory convert to webp
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        # convert to png first
        convert "$img" "${img%.*}".png

        # then convert png to webp
        cwebp "${img%.*}".png -q "${QUALITY}" -o "${img%.*}".webp >/dev/null 2>&1

        # remove png
        rm "${img%.*}".png

        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
            mkdir -p ${OUTPUTDIR} && mv "${img%.*}".webp "${OUTPUTDIR}"
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor 'Completed converting from img to webp.' "green" "*"
}

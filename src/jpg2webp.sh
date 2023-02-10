fn_jpg2webp(){
    check_cmd cwebp
    check_cmd convert
    
    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # for each webp in the input directory
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
            mv "${img%.*}".webp "${OUTPUTDIR}"
            bannerColor "Done." "green" "*"
        fi
    done
    bannerColor 'Completed converting from JPG to WEBP.' "green" "*"


}
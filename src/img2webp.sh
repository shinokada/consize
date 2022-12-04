fn_img2webp(){
    check_cmd cwebp
    check_cmd convert

    # for each png in the input directory convert to webp
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
        cwebp "$img" -q "${QUALITY}" -o "${img%.*}".webp
    done

    # for each webp in the input directory convet to webp
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        # convert to png first
        convert "$img" "${img%.*}".png

        # then convert png to webp
        cwebp "${img%.*}".png -q "${QUALITY}" -o "${img%.*}".webp
    done

    bannerColor 'Completed converting from img to webp.' "green" "*"

    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *.webp "${OUTPUTDIR}"
        bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
    fi

}
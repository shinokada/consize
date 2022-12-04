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
        convert "$img" "${OUTPUTDIR}/${img%.*}".png

        # then convert png to webp
        cwebp "${OUTPUTDIR}/${img%.*}".png -q "${QUALITY}" -o "${OUTPUTDIR}/${img%.*}".webp
    done

    bannerColor 'Completed converting from img to webp.' "green" "*"
}
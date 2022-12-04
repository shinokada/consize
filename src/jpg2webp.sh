fn_jpg2webp(){
    check_cmd cwebp
    check_cmd convert

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        # convert to png first
        convert "$img" "${OUTPUTDIR}/${img%.*}".png

        # then convert png to webp
        cwebp "${OUTPUTDIR}/${img%.*}".png -q "${QUALITY}" -o "${OUTPUTDIR}/${img%.*}".webp
    done
    bannerColor 'Completed converting from jpg to webp.' "green" "*"
}
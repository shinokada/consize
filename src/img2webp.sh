fn_img2webp(){
    check_cmd cwebp
    check_cmd convert

    if [ -n ${OUTPUTDIR} ];then
    mkdir -p ${OUTPUTDIR} 
    fi
    # This will NOT recursively convert. Only files in the INPUTDIR.

    # for each png in the input directory convert to webp
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
        file_name=$(basename "$img")
        cwebp "$img" -q "${QUALITY}" -o "${OUTPUTDIR}/${file_name%.*}".webp >/dev/null 2>&1 
    done

    # for each jpg or jpeg in the input directory convert to webp
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        # convert to png first
        file_name=$(basename "$img")
        convert "$img" "${OUTPUTDIR}/${file_name%.*}".png

        # then convert png to webp
        cwebp "${OUTPUTDIR}/${file_name%.*}".png -q "${QUALITY}" -o "${OUTPUTDIR}/${file_name%.*}".webp >/dev/null 2>&1

        # remove png
        rm "${OUTPUTDIR}/${file_name%.*}".png
    done

    bannerColor 'Completed converting from img to webp.' "green" "*"

}

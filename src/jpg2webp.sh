fn_jpg2webp(){
    check_cmd cwebp
    check_cmd convert
    
    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p "${OUTPUTDIR}" 
    fi
    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        if [ -n "${OUTPUTDIR}" ];then
            file_name=$(basename "$img")
            cwebp "$img" -q "${QUALITY}" -o "${OUTPUTDIR}/${file_name%.*}".webp >/dev/null 2>&1
        else
            cwebp "$img" -q "${QUALITY}" -o "${img%.*}".webp >/dev/null 2>&1
        fi
    done
    bannerColor 'Completed converting from JPG to WEBP.' "green" "*"
}
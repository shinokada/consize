fn_png2webp(){
    check_cmd cwebp
    
    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p "${OUTPUTDIR}" 
    fi
    # for each png in the input directory
    for img in $( find "${INPUTDIR}" -type f -iname "*.png" );
    do
        if [ -n "${OUTPUTDIR}" ];then
            file_name=$(basename "$img")
            cwebp "$img" -q "${QUALITY}" -o "${OUTPUTDIR}/${file_name%.*}".webp >/dev/null 2>&1
        else
            cwebp "$img" -q "${QUALITY}" -o "${img%.*}".webp >/dev/null 2>&1
        fi
    done

    bannerColor 'Completed converting png files to webp files.' "green" "*"
}

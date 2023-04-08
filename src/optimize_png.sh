fn_optimize_png(){
    check_cmd optipng

    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p "${OUTPUTDIR}" 
    fi

    for img in $(find "${INPUTDIR}" -type f -iname "*.png"); do
        if [ -n "${OUTPUTDIR}" ]; then
            file_name=$(basename "$img")
            optipng -o"${LEVEL}" -out "${OUTPUTDIR}/${file_name%.*}-optimized.png" "$img" >/dev/null 2>&1
        else
            optipng -o"${LEVEL}" -out "${img%.*}-optimized.png" "$img" >/dev/null 2>&1
        fi
    done

    bannerColor 'Completed optimizing png files.' "green" "*"
    
}
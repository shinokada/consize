fn_optimize_png(){
    check_cmd optipng

    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p "${OUTPUTDIR}" 
    fi

    for img in $(find "${INPUTDIR}" -type f -iname "*.png"); do
        if [ -n "${OUTPUTDIR}" ]; then
            file_name=$(basename "$img")
            optipng "$img" -out "${OUTPUTDIR}/${file_name%.*}-optimized.png" >/dev/null 2>&1
        else
            optipng "$img" -out "${img%.*}-optimized.png" >/dev/null 2>&1
        fi
    done

    bannerColor 'Completed optimizing png files.' "green" "*"
    
}
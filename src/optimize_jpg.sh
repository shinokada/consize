fn_optimize_jpg(){
    check_cmd jpegoptim

    if [ -n "${OUTPUTDIR}" ];then
    mkdir -p "${OUTPUTDIR} "
    fi
    # for each jpg or jpeg in the input directory
    # this will run recursively
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        if [ -n "${OUTPUTDIR}" ];then
            file_name=$(basename "$img")
            cp "$img" "${OUTPUTDIR}/${file_name%.*}"-optimized.jpg
            jpegoptim -m"${QUALITY}" --strip-all -d "${OUTPUTDIR}/${file_name%.*}"-optimized.jpg >/dev/null 2>&1
        else
            cp "$img" "${img%.*}"-optimized.jpg
            jpegoptim -m"${QUALITY}" --strip-all "${img%.*}"-optimized.jpg >/dev/null 2>&1 
        fi
    done

    bannerColor 'Completed optimizing jpg files.' "green" "*"
    
}
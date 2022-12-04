fn_optimize_jpg(){
    check_cmd jpegoptim

    # for each jpg or jpeg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        cp "$img" "${OUTPUTDIR}/${img%.*}"-optimized.jpg
        jpegoptim -m "${QUALITY}" "${OUTPUTDIR}/${img%.*}"-optimized.jpg
    done

    bannerColor 'Completed optimizing jpg files.' "green" "*"
}
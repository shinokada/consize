fn_webp2png(){
    check_cmd dwebp

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.webp" );
    do
        dwebp "$img" -o "${OUTPUTDIR}/${img%.*}".png
    done

    bannerColor 'Completed converting webp files to png files.' "green" "*"

}
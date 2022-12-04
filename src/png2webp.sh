fn_png2webp(){
    check_cmd cwebp

    # for each png in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
        cwebp "$img" -q "${QUALITY}" -o "${OUTPUTDIR}/${img%.*}".webp
    done

    bannerColor 'Completed converting png files to webp files.' "green" "*"

}
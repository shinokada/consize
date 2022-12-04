fn_png2webp(){
    check_cmd cwebp

    # for each png in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
        cwebp "$img" -q "${QUALITY}" -o "${img%.*}".webp
    done

    bannerColor 'Completed converting png files to webp files.' "green" "*"

    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *.webp "${OUTPUTDIR}"
        bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
    fi
}
fn_png2jpg(){
    check_cmd convert

    # for each png in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
        convert "$img" -quality "${QUALITY}"% "${OUTPUTDIR}/${img%.*}".jpg
    done

    bannerColor 'Completed converting png files to jpg files.' "green" "*"

}
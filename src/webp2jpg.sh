fn_webp2jpg(){
    check_cmd dwebp
    check_cmd convert

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.webp" );
    do
        # convert to png first
        dwebp "$img" -o "${OUTPUTDIR}/${img%.*}".png

        # then convert png to jpg
        convert "${OUTPUTDIR}/${img%.*}".png -quality "${QUALITY}"% "${OUTPUTDIR}/${img%.*}".jpg
    done

    bannerColor 'Completed converting webp files to jpg files.' "green" "*"

}
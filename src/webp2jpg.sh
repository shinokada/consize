fn_webp2jpg(){
    check_cmd dwebp
    check_cmd convert

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.webp" );
    do
        # convert to png first
        dwebp "$img" -o "${img%.*}".png

        # then convert png to jpg
        convert "${img%.*}".png -quality "${QUALITY}"% "${img%.*}".jpg
    done

    bannerColor 'Completed converting webp files to jpg files.' "green" "*"

    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *.jpg "${OUTPUTDIR}"
        bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
    fi
}
fn_webp2jpg(){
    check_cmd dwebp
    check_cmd convert

    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.webp" );
    do
        # convert to png first
        dwebp "$img" -o "${img%.*}".png >/dev/null 2>&1 

        # then convert png to jpg
        convert "${img%.*}".png -quality "${QUALITY}"% "${img%.*}".jpg

        # remove png
        rm "${img%.*}".png

        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
            mv "${img%.*}".jpg "${OUTPUTDIR}"
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor 'Completed converting webp files to jpg files.' "green" "*"
}
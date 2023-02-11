fn_webp2jpg(){
    check_cmd dwebp
    check_cmd convert

    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p "${OUTPUTDIR}" 
    fi

    # for each webp in the input directory
    for img in $( find "${INPUTDIR}" -type f -iname "*.webp" );
    do
        # convert to png first
        dwebp "$img" -o "${img%.*}".png >/dev/null 2>&1 

        # then convert png to jpg
        if [ -n "${OUTPUTDIR}" ];then
            file_name=$(basename "$img")
            convert "${img%.*}".png -quality "${QUALITY}"% "${OUTPUTDIR}/${file_name%.*}".jpg
        else
            convert "${img%.*}".png -quality "${QUALITY}"% "${img%.*}".jpg
        fi

        # remove png
        rm "${img%.*}".png
    done

    bannerColor 'Completed converting webp files to jpg files.' "green" "*"
}

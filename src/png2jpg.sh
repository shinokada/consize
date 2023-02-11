fn_png2jpg(){
    check_cmd convert
    
    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p "${OUTPUTDIR}" 
    fi
    # for each png in the input directory
    for img in $( find "${INPUTDIR}" -type f -iname "*.png" );
    do
        if [ -n "${OUTPUTDIR}" ];then
            file_name=$(basename "$img")
            convert "$img" -quality "${QUALITY}"% "${OUTPUTDIR}/${file_name%.*}".jpg 2>&1 >/dev/null
        else
            convert "$img" -quality "${QUALITY}"% "${img%.*}".jpg 2>&1 >/dev/null
        fi
    done

    bannerColor "Completed converting png files to jpg files." "green" "*"
}

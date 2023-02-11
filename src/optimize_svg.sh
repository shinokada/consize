fn_optimize_svg(){
    check_cmd svgo
    
    if [ -n "${OUTPUTDIR}" ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # for each svg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.svg" );
    do
        if [ -n "${OUTPUTDIR}" ];then
            file_name=$(basename "$img")
            svgo "$img" -o "${OUTPUTDIR}/${file_name%.*}"-optimized.svg >/dev/null 2>&1
        else
            svgo "$img" -o "${img%.*}"-optimized.svg >/dev/null 2>&1

        fi
    done

    bannerColor 'Completed optimizing svg files.' "green" "*"
}
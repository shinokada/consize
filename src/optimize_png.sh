fn_optimize_png(){
    check_cmd optipng

    if [ ${OUTPUTDIR} ];then
        mkdir -p ${OUTPUTDIR} 
    fi
    # # Multithreading count
    # PROCS=$(grep processor /proc/cpuinfo | wc -l)

    # # for each png in the input directory
    # do_file() {
    #     img="$1"
    #     optipng "$img" -out "${img%.*}-optimized.png" >/dev/null 2>&1
    # }
    # export -f do_file
    # find "${INPUTDIR}" -type f -iname "*.png" -print0 | xargs -0 -n1 -P $PROCS bash -c 'do_file "$@"' _
    for img in $(find "${INPUTDIR}" -type f -iname "*.png"); do
        optipng "$img" -out "${img%.*}-optimized.png" >/dev/null 2>&1

        # move optimized png files
        if [ "${OUTPUTDIR}" ]; then
            bannerColor "Moving optimized PNG files to ${OUTPUTDIR}..." "blue" "*"
            mv "${img%.*}-optimized.png" "${OUTPUTDIR}" 2>&1 >/dev/null
            bannerColor "Done." "green" "*"
        fi
    done

    bannerColor 'Completed converting img files to webp files.' "green" "*"
    
}
fn_optimize_png(){
    check_cmd optipng

    # Multithreading count
    PROCS=$(grep processor /proc/cpuinfo | wc -l)

    # for each png in the input directory
    do_file() {
        img="$1"
        optipng "$img" -out "${img%.*}-optimized.png"
    }
    export -f do_file
    find "${INPUTDIR}" -type f -iname "*.png" -print0 | xargs -0 -n1 -P $PROCS bash -c 'do_file "$@"' _

    bannerColor 'Completed converting img files to webp files.' "green" "*"

    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *-optimized.png "${OUTPUTDIR}"
        bannerColor "Moved all the optimized PNG files to ${OUTPUTDIR}." "green" "*"
    fi
}
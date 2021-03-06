fn_optimize_png(){
    check_cmd optipng

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    fi

    # Multithreading count
    PROCS=$(grep processor /proc/cpuinfo | wc -l)

    # for each png in the input directory
    do_file() {
        img="$1"
        optipng "$img" -out "${img%.*}-optimized.png"
    }
    export -f do_file
    find "${DIR}" -type f -iname "*.png" -print0 | xargs -0 -n1 -P $PROCS bash -c 'do_file "$@"' _

    bannerColor 'Completed converting img files to webp files.' "green" "*"

}
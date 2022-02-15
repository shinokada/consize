fn_webp2png(){
    . "${script_dir}/lib/utils.sh"
    check_cmd dwebp

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    fi

    # for each webp in the input directory
    for img in $( find ${DIR} -type f -iname "*.webp" );
    do
        dwebp "$img" -o "${img%.*}".png
    done
}
fn_jpg2png(){
    . "${script_dir}/lib/utils.sh"
    check_cmd convert
    
    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    fi

    # for each jpg or jpeg in the input directory
    for img in $( find ${DIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        convert "$img" "${img%.*}".png
    done
}
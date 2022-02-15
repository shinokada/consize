fn_optimize_resize(){
    # directory containing images
    input_dir="$1"

    if [[ -z "$input_dir" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "$width" ]]; then
        echo "Please specify image width."
        exit 1
    elif [[ -z "$height" ]]; then
        echo "Please specify image ."
        dimension="${width}x"
    else
        dimension="${width}x${height}"
    fi

    mkdir "$input_dir/resized"

    # for each webp in the input directory
    for img in $( find $input_dir -type f -iname "*.webp" );
    do
        # resize first
        convert "${img}" -resize "${dimension}" "${input_dir}/resized/${img}"
    done

}
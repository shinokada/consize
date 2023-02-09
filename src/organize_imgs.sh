fn_organize_imgs(){
    input_dir="$1"

    if [[ -z "$input_dir" ]]; then
        bannerColor 'Please specify an input directory.' "red" "*"
        exit 1
    fi

    for img in $( find $input_dir -type f -iname "*" );
    do
        # get the type of the image
        img_type=$(basename `file --mime-type -b $img`)

        # create a directory for the image type
        mkdir -p $img_type

        # move the images into their type directory
        rsync -a $img $img_type
    done
    bannerColor 'Moved all files to each directory.' "green" "*"
}
fn_organize_files(){

    for img in $( find ${INPUTDIR} -type f -iname "*" );
    do
        # Skip processing of dot files
        if [[ ${img:0:1} == '.' ]]; then
            continue
        fi

        # get the type of the image
        img_type=$(basename `file --mime-type -b $img`)

        echo "Processing file: $img"
        echo "Image type: $img_type"
        
        # create a directory for the image type
        mkdir -p $img_type

        # move the images into their type directory
        rsync -a $img $img_type
    done
    bannerColor 'Moved all files to each directory.' "green" "*"
}
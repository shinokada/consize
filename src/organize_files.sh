fn_organize_files(){

    for img in $( find ${INPUTDIR} -type f -iname "*" );
    do
        # Skip processing of dot files
        if [[ $(basename "$img") =~ ^\.[^.] ]]; then
            continue
        fi

        # get the type of the image
        img_type=$(basename `file --mime-type -b $img`)

        # create a directory for the image type
        mkdir -p $img_type

        # move the images into their type directory
        rsync -a $img $img_type
    done
    bannerColor 'Moved all files to each directory.' "green" "*"
}
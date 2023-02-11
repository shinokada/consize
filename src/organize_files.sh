fn_organize_files(){
    bannerColor "Are you sure you want to organize this directory?" "yellow" "*"
    read -p "Enter 'yes' or 'no': " answer

    if [ "$answer" != "yes" ]; then
        echo "Exiting the script..."
        return
    fi

    for img in $( find ${INPUTDIR} -type f -iname "*" );
    do
        # Skip processing of dot files
        if [[ $(basename "$img") =~ ^\.[^.] ]]; then
            continue
        fi

        # get the type of the image
        img_type=$(basename `file --mime-type -b $img`)

        # create a directory for the image type in the input directory
        mkdir -p "${INPUTDIR}${OUTPUTDIR}/${img_type}"

        # move the images into their type directory
        mv "$img" "${INPUTDIR}${OUTPUTDIR}/${img_type}"
    done
    bannerColor 'Moved all files to each directory.' "green" "*"
}
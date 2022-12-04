fn_jpg2png(){
    check_cmd convert

    # for each jpg or jpeg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        convert "$img" "${OUTPUTDIR}/${img%.*}".png
    done
    bannerColor 'Completed converting from jpg to png.' "green" "*"
}
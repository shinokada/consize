fn_jpg2png(){
    check_cmd convert

    # for each jpg or jpeg in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        convert "$img" "${img%.*}".png
    done
    bannerColor 'Completed converting from jpg to png.' "green" "*"

    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *.webp "${OUTPUTDIR}"
        bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
    fi
}
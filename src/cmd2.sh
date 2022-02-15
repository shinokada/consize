fn_cmd2() {
    # from https://github.com/ko1nksm/getoptions/blob/master/examples/advanced.sh
    
    echo "FLAG_A: $FLAG_A"
    echo "FLAG_B: $FLAG_B"
    if [ ${FLAG_C+x} ]; then
        echo "FLAG_C: $FLAG_C"
    else
        echo "FLAG_C: <unset>"
    fi
    echo "VERBOSE: $VERBOSE"
    echo "PARAM: $PARAM"
    echo "LANG: $LANG"
    echo "NUMBER: $NUMBER"
    echo "RANGE: $RANGE"
    echo "PATTERN: $PATTERN"
    echo "BLOOD_TYPE: $BLOOD_TYPE"
    echo "REGEX: $REGEX"
    echo "MULTIPLE: $MULTIPLE"
    if [ ${#ARRAY[@]} -eq 0 ]; then
        disp_array ARRAY
    else
        disp_array ARRAY "${ARRAY[@]}"
    fi
    eval disp_array PARRAY "$PARRAY"
    echo "OPTION: $OPTION"
    echo "VERSION: $VERSION"
    disp_array arguments "$@"
}

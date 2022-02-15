fn_cmd1() {
    echo "FLAG_A: $FLAG_A"
    echo "FLAG_B: $FLAG_B"
    echo "FLAG_F: $FLAG_F"
    echo "FLAG_W: $FLAG_W"
    echo "VERBOSE: $VERBOSE"
    echo "PARAM: $PARAM"
    echo "NUMBER: $NUMBER"
    echo "OPTION: $OPTION"
    echo "VERSION: $VERSION"

    echo "My variable VAR1: $VAR1."

    i=0
    while [ $# -gt 0 ] && i=$((i + 1)); do
        echo "$i: $1"
        shift
    done
}

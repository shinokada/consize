fn_create() {
    # sample code
    echo "FLAG_A: $FLAG_A"
    echo "PARAM: $PARAM"
    echo "My variable VAR1: $VAR1."

    i=0
    while [ $# -gt 0 ] && i=$((i + 1)); do
        echo "$i: $1"
        shift
    done
}

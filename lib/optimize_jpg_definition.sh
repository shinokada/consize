parser_definition_optimize_jpg() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Optimize JPG images.' ''
    msg -- 'Options:'
    param DIR -d --dir -- "accepts --dir value / --dir=value"
    disp :usage -h --help
}
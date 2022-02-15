parser_definition_jpg2png() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Convert JPG to PNG images.' ''
    msg -- 'Options:'
    param DIR -d --dir -- "accepts --dir value / --dir=value"
    disp :usage -h --help
}
parser_definition_jpg2webp() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Convert JPG and PNG images to webp format.' ''
    msg -- 'Options:'
    param DIR -d --dir -- "accepts --dir value / --dir=value"
    param QUALITY -q --quality -- "accepts --quality value / --quality=value"
    disp :usage -h --help
}
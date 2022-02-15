parser_definition_resize() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Resize images' ''
    msg -- 'Options:'
    param DIR -d --dir -- "accepts --dir value / --dir=value"
    param WIDTH -w --width -- "accepts --width value / --width=value"
    param HEIGHT -h --height -- "accepts --height value / --height=value"
    disp :usage --help
}
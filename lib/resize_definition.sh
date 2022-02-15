parser_definition_resize() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Resize images' ''
    msg -- 'Options:'
    param PARAM -d --dir -- "accepts --dir value / --dir=value"
    param PARAM -w --width -- "accepts --width value / --width=value"
    param PARAM -h --height -- "accepts --height value / --height=value"
    disp :usage --help
}
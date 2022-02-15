parser_definition_create() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'create example' ''
    msg -- 'Options:'
    flag FLAG_A -a -- "message a"
    param PARAM -d --dir -- "accepts --dir value / --dir=value"
    disp :usage -h --help
}

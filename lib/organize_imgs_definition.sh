parser_definition_organize_imgs() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Oraganize images.' ''
    msg -- 'Options:'
    param INPUTDIR -i --input init:="./" -- "input dir, accepts --dir value / --dir=value"
    param OUTPUTDIR -o --output -- "output dir, accepts --dir value / --dir=value"
    disp :usage -h --help
}
parser_definition_optimize_svg() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Optimize JPG images.' ''
    msg -- 'Options:'
    param INPUTDIR -i --input init:="./" -- "input dir, accepts --dir value / --dir=value"
    param OUTPUTDIR -o --output init:="./" -- "output dir, accepts --dir value / --dir=value"
    disp :usage -h --help
}
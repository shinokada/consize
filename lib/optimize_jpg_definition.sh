parser_definition_optimize_jpg() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Optimize JPG images.' ''
    msg -- 'Options:'
    param INPUTDIR -i --input init:="./" -- "input dir, accepts --dir value / --dir=value"
    param OUTPUTDIR -o --output -- "output dir, accepts --dir value / --dir=value"
    param QUALITY -q --quality init:=100 -- "accepts --quality value / --quality=value"
    disp :usage -h --help
}
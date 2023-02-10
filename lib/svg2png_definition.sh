parser_definition_svg2png() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Resize images' ''
    msg -- 'Options:'
    param INPUTDIR -i --input init:="./" -- "input dir, accepts --dir value / --dir=value"
    param OUTPUTDIR -o --output -- "output dir, accepts --dir value / --dir=value"
    param WIDTH -w --width -- "accepts --width value / --width=value"
    param QUALITY -q --quality init:=100 -- "accepts --height value / --height=value"
    disp :usage --help
}
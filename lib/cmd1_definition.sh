parser_definition_cmd1() {
    # from https://github.com/ko1nksm/getoptions/blob/master/examples/basic.sh
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'getoptions basic example' ''
    msg -- 'Options:'
    flag FLAG_A -a -- "message a"
    flag FLAG_B -b -- "message b"
    flag FLAG_F -f +f --{no-}flag -- "expands to --flag and --no-flag"
    flag FLAG_W --with{out}-flag -- "expands to ---with-flag and --without-flag"
    flag VERBOSE -v --verbose counter:true init:=0 -- "e.g. -vvv is verbose level 3"
    param PARAM -p --param pattern:"foo | bar" -- "accepts --param value / --param=value"
    param NUMBER -n --number validate:number -- "accepts only a number value"
    option OPTION -o --option on:"default" -- "accepts -ovalue / --option=value"
    disp :usage -h --help
}

" let b:ale_reasonml_refmt_options = '-w 120'
" let b:ale_reasonml_refmt_executable = 'bsrefmt'
let b:ale_reasonml_refmt_executable = './node_modules/.bin/bsrefmt'

let b:ale_fixers = ['refmt']
let b:ale_linters = ['ols']

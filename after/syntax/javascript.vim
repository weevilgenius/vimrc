" automatic folding for Javascript
setlocal foldmethod=syntax
setlocal foldlevelstart=0 " begin with all folds closed
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend


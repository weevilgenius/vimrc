syntax on
set number                      "show line numbers
set shiftwidth=4                "default indent width
set tabstop=4                   "default tab display width
set softtabstop=4               "treat 4 spaces as a tab
set expandtab                   "use spaces instead of hard tabs
set autoindent                  "maintain previous indent when starting new line
"set cindent                     "use indenting for c-like programs
"set cinkeys-=0#                 "remove autoindenting for preprocessor lines
set noincsearch                 "don't use incremental searching
set nohlsearch                  "don't highlight search results
set backspace=indent,eol,start  "backspace over indent, end of line, start of insert
set showmatch                   "highlight closing brackets
set modeline                    "check for file-specific settings
set encoding=utf-8              "use utf-8 encoding by default
set list listchars=tab:»·,trail:·   "show visible tabs and trailing spaces
                                    "(alternate tab:>-,trai:-)
set printoptions=paper:letter,header:0,number:n,syntax:y,duplex:off,wrap:y
set tabpagemax=50               "increase maximum number of tabs to 50
set nobackup nowritebackup      "disable file backups
set directory^=~/.vim_swap// "put all swap files together in one place
set spellfile=~/.vim_runtime/spell/en.utf-8.add "custom words for the spelling dictionary
set ssop-=options               " don't save global/local values in a session
set ssop-=folds                 " don't save folds in a session
if version >= 730
    set cryptmethod=blowfish        "use strong encryption
endif


if !exists("autocommands_loaded")
    let autocommands_loaded = 1

    "css, yml, and sql files get tabstops of 2 characters
    autocmd FileReadPost,BufReadPost *.css,*.sql,*.yml set ts=2 sts=2 sw=2

    "puppet files get puppet syntax
    autocmd FileReadPost,BufReadPost *.pp set ft=puppet

    " use hard tabs for go files
    autocmd FileReadPost,BufReadPost *.go set noet nolist

    " Dockerfiles
    autocmd BufNewFile,BufRead Dockerfile set ft=dockerfile

endif

" color scheme
set background=light
colorscheme solarized

" Options that apply only to gvim
if has("gui_running")

    " add shift-left and shift-right bindings for changing tabs
    nmap <silent> <S-Left> :tabprev<Cr>
    nmap <silent> <S-Right> :tabnext<Cr>
    imap <silent> <S-Left> <Esc>:tabprev<Cr>
    imap <silent> <S-Right> <Esc>:tabnext<Cr>
    vmap <silent> <S-Left> :tabprev<Cr>
    vmap <silent> <S-Right> :tabnext<Cr>

    " remove GUI toolbar
    set guioptions-=T

endif


" Highlight rows longer than 80 characters
function ToggleOverLengthHi()
    if exists("b:overlengthhi") && b:overlengthhi
        highlight clear OverLength
        let b:overlengthhi = 0
        echo "overlength hilight off"
    else
        " adjust colors/styles as needed
        highlight OverLength ctermbg=darkred gui=undercurl guisp=blue
        " change 81 to be 1+(number of columns)
        match OverLength /\%81v.\+/
        let b:overlengthhi = 1
        echo "overlength hilight on"
    endif
endfunction
map <silent> <F1> <Esc>:call ToggleOverLengthHi()<CR>


command Q qa
command W w|qa
"command Q call delete('.tags')|call delete('.clang-format')|qa
command Qone q|TlistClose
cnoreabbrev q Qone
command Html s/<[^>]*/\r&/g|g/^$/d

set colorcolumn=120
hi ColorColumn ctermbg=0 guibg=lightgrey
set updatetime=4500
set completeopt=menu,preview,longest
set completeopt-=preview
set conceallevel=2
set concealcursor=vin

set rtp+=~/.vim/bundle/YouCompleteMe "YCM is installed with some error, so Vundle can't distinguish it automatically.

let g:clang_c_options='-std=gun11'
let g:clang_cpp_options='-std=c++11 -stdlib=libc++'

autocmd VimEnter * NERDTree
autocmd VimEnter * silent! !eval '~/.vim/bundle/YCM-Generator/config_gen.py . >/dev/null 2>&1 &'
autocmd VimLeave * silent! !eval 'rm newtags .tags .clang-format .ycm_extra_conf.py'

set tags=.tags
if has('macunix')
    autocmd VimEnter * silent! !eval 'cp ~/.vim/clang-format.conf ./.clang-format; ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -o newtags; mv newtags .tags'
    au BufWritePost *.h,*.c,*.cpp,*.hpp,*.cc silent! !eval 'ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -o newtags; mv newtags .tags'
else
    autocmd VimEnter * silent! !eval 'cp ~/.vim/clang-format.conf ./.clang-format; ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ -o newtags; mv newtags .tags'
    au BufWritePost *.h,*.c,*.cpp,*.hpp,*.cc silent! !eval 'ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ -o newtags; mv newtags .tags'
endif
autocmd CursorHold,CursorHoldI * update

autocmd FileType c,cpp,cc setlocal equalprg=clang-format

augroup templates
    autocmd!
    autocmd BufRead *.h,*.hpp,*.c,*.cpp,*.cc call s:ApplyTemplate()

    function! s:ApplyTemplate()
        if getfsize(expand('%')) == 0
            if expand('%:t:r') == 'main'
                execute "0r ~/.vim/templates/" . expand('%:t')
            else
                execute "0r ~/.vim/templates/template." . expand('%:e')
                if expand('%:e') == 'h' || expand('%:e') == 'hpp'
                    execute "%s/this_should_be_replaced/\\=toupper('" . expand('%:t') . "')" . "/e"
                    execute "%s/\\./_" . "/e"
                elseif expand('%:e') == 'c' || expand('%:e') == 'cpp' || expand('%:e') == 'cc'
                    execute "%s/this_should_be_replaced/" . expand('%:t:r') . "/e"
                endif
            endif
        endif
    endfun
augroup END


let g:NERDTreeWinSize=24
let NERDTreeIgnore=['\(\.sh\|\.yaml\|\.mk\|\.h\|\.c\|\.hpp\|\.cpp\|\.cc\|makefile\|Makefile\|CMakeLists.txt\|\.html\)\@<!$[[file]]', 'bin']
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowLineNumbers=1

"let g:ycm_semantic_triggers = {
"  \   'h': [ 're!.' ],
"  \   'c': [ 're!.' ],
"  \   'hpp': [ 're!.' ],
"  \   'cpp': [ 're!.' ]
"  \ }
let g:ycm_semantic_triggers = {
            \   'h': [ '.', '->', '::' ],
            \   'c': [ '.', '->', '::' ],
            \   'hpp': [ '.', '->', '::' ],
            \   'cpp': [ '.', '->', '::' ],
            \   'cc': [ '.', '->', '::' ]
            \ }

let g:Tlist_Use_Right_Window=1
let g:Tlist_Show_One_File=1

let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf=$HOME."/.vim/.ycm_extra_conf.py"
let g:ycm_server_keep_logfiles=1
let g:ycm_server_log_level='debug'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header=0
let g:syntastic_cpp_remove_include_errors=1
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_quiet_messages = {'regex': 'No such file or directory'}

let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1
let g:NERDCustomDelimiters = {
\   'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
\   'cpp': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
\   'cc': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
\}

let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_color_term = 60

let skeletons#autoRegister = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1

"let g:formatdef_my_custom_cpp = '"clang-format -i ".@%'
"let g:formatters_cpp = ['my_custom_cpp']

nnoremap cgt :wa<CR> \| :2,$tabdo :tabc<CR> \| <C-w><C-j> :q<CR>
nmap <leader>cv <leader>ca<leader>cc<leader>ca

nnoremap <F5> :wa<CR> \| :sh<CR>

nnoremap <leader>tg :TlistToggle<CR>

nnoremap mh <C-w><C-h>
nnoremap mj <C-w><C-j>
nnoremap mk <C-w><C-k>
nnoremap ml <C-w><C-l>
nnoremap mw <C-w><C-w>
nnoremap mt <C-w><C-t>
nnoremap mb <C-w><C-b>
nnoremap mp <C-w><C-p>

nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR> \| :NERDTreeFind<CR> \| :wincmd p<CR>
nnoremap <C-i> <C-i> \| :NERDTreeFind<CR> \| :wincmd p<CR>
nnoremap <C-o> <C-o> \| :NERDTreeFind<CR> \| :wincmd p<CR>
function! Jump(type)
    if filereadable(".tags")
        if a:type == "single"
            execute "2tag " . expand("<cword>")
            NERDTreeFind
            wincmd p
        else
            execute "tjump " . expand("<cword>")
        endif
    else
        echo 'tags file not ready'
    endif
endfunction
nnoremap <C-]> :call Jump('single')<CR>
nnoremap g<C-]> :call Jump('multi')<CR>

""" Custom Search & Replace
function! CustomGrepCore(target)
    silent! execute 'vimgrep '.a:target.' **/*.h **/*.hpp **/*.c **/*.cpp **/*.cc'
    return len(getqflist())
endfunction

function! CustomGrep(...)
    let before = expand('%:p')
    if a:0 == 0
        let res = CustomGrepCore("<cword>")
    else
        let res = CustomGrepCore(a:1)
    endif
    if res != 0
        cope
        execute "normal \<C-w>\<C-k>"
        if before != expand('%:p')
            execute "normal \<C-o>"
        endif
    endif
endfunction

function! CustomReplace(...)
    if a:0 == 1
        let target = expand("<cword>")
        let newWord = a:1
    elseif a:0 == 2
        let target = a:1
        let newWord = a:2
    else
        return
    endif
    let g:target = newWord
    let g:lastWord = target

    let before = expand('%:p')
    let res = CustomGrepCore(target)
    if res != 0
        if before != expand('%:p')
            execute "normal \<C-o>"
        endif
    endif
    cdo execute 's/'.target.'/'.newWord.'/gc | w'

    "let cnt = CustomGrepCore(target)
    "let x = 0
    "while x < cnt
    "    execute 's/'.target.'/'.newWord.'/gc'
    "    w
    "    if x != cnt - 1
    "        cnext
    "    endif
    "    let x = x + 1
    "endwhile
endfunction

function! CustomUndoReplace()
    let before = expand('%:p')
    let res = CustomGrepCore(g:target)
    if res != 0
        cfdo execute '%s/'.g:target.'/'.g:lastWord.'/g | w'
        if before != expand('%:p')
            execute "normal \<C-o>"
        endif
    endif
endfunction

command! -nargs=? Grep :call CustomGrep(<f-args>)
command! -nargs=+ Replace :call CustomReplace(<f-args>)
command! UndoReplace :silent! call CustomUndoReplace()
nnoremap <leader>vv :Grep<CR>

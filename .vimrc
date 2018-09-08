syntax on
noremap <C-j> 3+
noremap <C-k> 3-
nnoremap Y y$
noremap # :call ToggleCommentSelection()<CR>
nnoremap R gR
nnoremap <Space>l :hide bn!<CR>
nnoremap <Space>h :hide bp!<CR>
nnoremap <Tab> <C-w>w
nnoremap <C-h> <C-w>W
vnoremap s y:%s/<C-R>"//g<Left><Left>
" インサート中に誤ってエンターを押してしまったときは C-b
inoremap <C-b> <Esc>kA


" ファイル ---------------------------------------------------------
set hidden
set autoread
set isfname-==
" 2個上のディレクトリ以下から再帰的に探す
set tags=+../../**/tags

" 編集 ------------------------------------------------------------
"set autoindent smartindent
"set smarttab
set tabstop=2 softtabstop=2 shiftwidth=2
set cinoptions=t0,:0,g0,(0
set backspace=indent,eol,start
set formatoptions=tcqnmM
set listchars=tab:>-
set iskeyword+=-,!,?
set indentkeys-=0#
set virtualedit=block

" カーソル移動 -----------------------------------------------------
set showmatch matchtime=1
set matchpairs+=<:>
set whichwrap+=h,l,<,>,[,],b,s

" 表示 -------------------------------------------------------------
set number
set nowrap
set ruler
set ruf=%45(%12f%=\ %m%{'['.(&fenc!=''?&fenc:&enc).']'}\ %l-%v\ %p%%\ [%02B]%)
set statusline=%f\ %m%=%{(&fenc!=''?&fenc:&enc).':'.&ff}%{(&list?'>':'')}\ %l-%v\ %p%%\ [%02B]
set showcmd
set cmdheight=1
set laststatus=2
set shortmess+=I
set nofoldenable
set vb t_vb=

" 検索 -------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set nohlsearch
set keywordprg=man\ -a

" 補完・履歴 -------------------------------------------------------
set wildmenu
set history=50

" ウィンドウ -------------------------------------------------------
set splitbelow
set splitright
set sessionoptions+=resize
set previewheight=5
" Opsplorer
let s:split_width=100


""augroup MyAutocmd
""  au!
""  au BufEnter * lcd %:p:h
""  au BufNewFile,BufReadPost  vim   let b:commentSymbol="\""
""  au BufNewFile,BufReadPost  *.c,*.h,*.cpp,*.d,*.java   let b:commentSymbol="//"
""  au BufNewFile,BufReadPost  *.lua let b:commentSymbol="--"
""  au BufNewFile *.h call IncludeGuard()
""  au BufNewFile *.rb call append(0, "#!/usr/bin/env ruby")
""  au BufWritePost * if getline(1) =~ "^#!" | exe "silent !chmod +x %" | endif
""  au BufNewFile,BufReadPost \cmakefile,*.mak setlocal list noexpandtab
""  au BufNewFile,WinEnter * hi ZenkakuSpace guibg=NONE gui=underline guifg=#90e09f| match ZenkakuSpace /　/
""
""  au FileType vim set sw=2 ts=2 sts=2 et
""  au FileType c,cpp call C_Setting()
""  au FileType ruby call Ruby_Setting()
""  autocmd Syntax * call MySyntax()
""augroup END

"function! MySyntax()
"  syn keyword Return return exit | hi Return ctermfg=red  gui=bold     guifg=red
"  syn keyword Break  break | hi Break gui=none guifg=#0000ff
"  syn keyword Continue continue | hi Continue gui=none guifg=#007F7F
"  syn keyword Debug DEBUG debug dprintf | hi Debug ctermfg=None ctermbg=red gui=bold guifg=#ff00ff guibg=#ffffff
"  syn keyword Fallthrough fallthrough | hi Fallthrough gui=underline guifg=red
"  syn keyword cppPublic public | hi cppPublic guifg=#0000ff ctermfg=darkcyan
"  syn keyword cppPrivate protected private | hi cppPrivate guifg=#006600 ctermfg=darkred
"  syn keyword Virtual virtual | hi Virtual guifg=brown ctermfg=3
"endfunction
"
"function! C_Setting()
"  set isk-=!
"  setlocal ts=4 sts=4 sw=4 noet
"  set fo-=ro
"  " インデントレベルを合わせて貼り付け
"  nnoremap <buffer> p p=`]
"  set foldmethod=syntax
"  syn region myFold start="{" end="}" transparent fold
"  set foldnestmax=1
"  iab case case<CR><C-D>break;<Up>
"  iab default: default:<CR>break;<Up>
"  if filereadable("./Makefile")
"    setlocal makeprg=make
"  else
"    setlocal makeprg=gcc\ %
"  endif
"endfunction
"
"function! Ruby_Setting()
"  setlocal ts=2 sts=2 sw=2
"  comp ruby
"  nnoremap <buffer> <F5> :make %<CR>
"  iab <buffer> ei each_with_index
"endfunction
"
"" 現在行をコメントトグル
"" 選択中はその範囲を
"function! ToggleCommentSelection() range
"  if exists('b:commentSymbol')
"    let cs = b:commentSymbol
"  else
"    let cs = "#"
"  endif
"  let cl = a:firstline
"  while (cl <= a:lastline)
"    let line = getline(cl)
"    if strpart(line, match(line, "[^ \t]"), strlen(cs)) == cs
"      let i = 0
"      while (i < strlen(cs))
"        normal! ^x
"        let i = i + 1
"      endwhile
"    else
"      execute "normal! I" . cs
"    endif
"    normal! j
"    let cl = cl + 1
"  endwhile
"endfunction

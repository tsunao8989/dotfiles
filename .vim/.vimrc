"----------------------------------------------------------
" 基本設定
"----------------------------------------------------------
" ファイル読み込み時の文字コード
set encoding=utf-8
" マルチバイト文字
scriptencoding utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別
set fileformats=unix,dos,mac
" 特殊文字が崩れる問題の対応
set ambiwidth=double
" ウィンドウのタイトルバーにファイルのパス情報を表示
set title
" 行番号を表示
set number
" ペアの括弧を表示
set showmatch
" シンタックスハイライト有効化
syntax on
" カラースキームの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=red

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
" タブ入力を空白文字に変更
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 改行時に前の行のインデントを継続
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減
set smartindent
" smartindent で増減する幅
set shiftwidth=4

"----------------------------------------------------------
" 文字検索
"----------------------------------------------------------
" インクリメンタルサーチ
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" ESCキー 2回でハイライトを切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
" カーソル行のハイライト
set cursorline
" カーソル左右移動で行末から次の行への移動が可能
set whichwrap=b,s,h,l,<,>,[,],~
" 表示行単位でカーソルを移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" バックアスペースの有効化
set backspace=indent,eol,start

" コマンドモードの補完
set wildmenu
" 保存するコマンド履歴の数
set history=5000
" 括弧の補完
inoremap { {}<LEFT>
inoremap ( ()<LEFT>

"----------------------------------------------------------
" マウス有効化
"----------------------------------------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"----------------------------------------------------------
" マウス有効化
"----------------------------------------------------------
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


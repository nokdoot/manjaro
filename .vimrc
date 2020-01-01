"파일 위치 : ~/.vimrc

"자연스러운 위아래 커서이동
set number            " line 표시를 해줍니다.
set ai                    " auto indent
set si					" smart indent
"set cindent            " c style indent
set shiftwidth=4      " shift를 4칸으로 ( >, >>, <, << 등의 명령어)
set shiftround
set tabstop=4         " tab을 4칸으로
set softtabstop=4
set expandtab       " tab 대신 띄어쓰기로
set shiftround      " >> 를 통해서 정렬을 해줄 때 가장 가까운 indent level 로 이동.
"set ignorecase      " 검색시 대소문자 구별하지않음
set hlsearch         " 검색시 하이라이트(색상 강조)
set background=dark  " 검정배경을 사용할 때, (이 색상에 맞춰 문법 하이라이트 색상이 달라집니다.)
"set nocompatible   " 방향키로 이동가능
"set fileencodings=utf-8,euc-kr    " 파일인코딩 형식 지정
set bs=indent,eol,start    " backspace 키 사용 가능
set history=20    " 명령어에 대한 히스토리를 20개까지
set ruler              " 상태표시줄에 커서의 위치 표시
"set nobackup      " 백업파일을 만들지 않음
set title               " 제목을 표시
set showmatch      " 매칭되는 괄호를 보여줌
set matchtime=1    " 매칭되는 괄호를 보여주는 시간 (10 분의 n초)
"set nowrap         " 자동 줄바꿈 하지 않음
"set wmnu           " tab 자동완성시 가능한 목록을 보여줌
syntax on           " 문법 하이라이트 킴
set scrolloff=8 "search 결과의 위치를 화면 아래에서 8만큼 띄움
set cursorline      " 현재 커서 위치를 표시

"set mouse=a
"set clipboard=unnamed
"set backupcopy=yes

" 명령어 시작키 추가
let mapleader = "-"
" localleader 는 굳이 필요한가?
let maplocalleader = "--"

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType perl,sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cx :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" mapping, 항상 non-recursive mapping 을 사용하자.

" imap
" 한 줄 삭제
inoremap <c-d> <esc>dd

" 보완필요 - 파일 시작과 끝부분에서 애매하게 동작
" 행 위, 아래로 이동
nnoremap <c-s-k> ddkP
nnoremap <c-s-j> ddp

" increase indents for inner block
nnoremap <leader>ib >i{
" decrease indents for inner block
nnoremap <leader>db <i{

" 라인번호 토글링
nnoremap <F5> :set number!<CR>

" 하이라이트 토글링
nnoremap <F6> :set hlsearch!<CR>

nnoremap * :set hlsearch<CR> * <S-n>

" select word
nnoremap <space> viwh 
" 단어 감싸기
nnoremap <leader>w" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>w' viw<esc>a'<esc>hbi'<esc>lel

" escape HTML tag
" vnoremap <F5> '<,'>s/

"markdown 하이라이트
hi markdownItalic cterm=italic ctermfg=lightmagenta
hi markdownBold cterm=bold ctermfg=lightmagenta
hi markdownBoldItalic cterm=bold,italic ctermfg=lightmagenta
hi markdownCode ctermbg=darkgreen

"ctags
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> "tab으로 열기
noremap <C-\>l :vsp <CR>:exec("tag ".expand("<cword>"))<CR><C-W>r
noremap <C-\>h :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <C-\>k :sp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <C-\>j :sp <CR>:exec("tag ".expand("<cword>"))<CR><C-W>r

"mojo 하이라이트
"Configurations variables:
    :let mojo_highlight_data = 1
	"Highlight embedded Perl code in __DATA__ sections of your Perl files.

"   :let mojo_disable_html = 1
	"Don't highlight html inside __DATA__ templates - Perl code only.

"   :let mojo_no_helpers = 1
	"Don't highlight default and tag helpers.

"복붙기능 - xclip 필요
"vmap <C-c> : '<,'>w! ~/xclip \| !xclip -sel clip < ~/xclip <ENTER> <ENTER>
"set clipboard=unnamedplus - 아래를 쓰려면 필요하다는데 없어도 되더라
vnoremap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR><Return>

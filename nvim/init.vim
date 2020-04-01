if &shell =~# 'fish$'
    set shell=sh
endif

set nocp

call plug#begin()

	Plug 'chriskempson/base16-vim'
	Plug 'junegunn/fzf'
	Plug 'itchyny/lightline.vim'	
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'chrisbra/Colorizer'
	Plug 'jiangmiao/auto-pairs'
	Plug 'dag/vim-fish'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

syntax enable
filetype plugin indent on

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
colorscheme base16-material-darker

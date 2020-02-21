call plug#begin()

	Plug 'chriskempson/base16-vim'
	Plug 'junegunn/fzf'
	Plug 'mhinz/vim-startify'
	Plug 'itchyny/lightline.vim'	
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'

call plug#end()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
colorscheme base16-material-darker

command! -nargs=0 Sw w !sudo tee % > /dev/null

PLUG_PATH="~/.vim/pack/plugins/start"

## declare an array variable
declare -a arr=(
   "wellle/targets.vim"
   "lervag/vimtex" 
   "plasticboy/vim-markdown" 
   "osyo-manga/vim-over"
   "junegunn/goyo.vim"
   "preservim/nerdtree"
   "iamcco/markdown-preview.nvim"
   "ycm-core/YouCompleteMe")

for i in "${arr[@]}"
do
   git clone "http://github.com/"$i".git" $PLUG_PATH/$(basename "$i")
done

# install ycmd manually
cd $PLUG_PATH/YouCompleteMe
git submodule update --init --recursive
python install.py

# # install markdown-preview manually
cd $PLUG_PATH/markdown-preview.nvim/app
npm install
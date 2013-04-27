VIMDIR=$( cd $(dirname $0); pwd)

echo $VIMDIR

ln -si $VIMDIR/vimrc ~/.vimrc


help:
	@echo "make all\t\t -> install git config, vim config, mercurial config"
	@echo "make ~/.vim\t\t -> install vim config"
	@echo "make ~/.hgrc\t\t -> install mercurial config"
	@echo "make ~/.gitconfig\t -> install git config"
	@echo "make clean\t\t -> Remove all config deploy"
	@echo "make help\t\t -> Display this help"

all: ~/.gitconfig ~/.hgrc ~/.vim

~/.gitconfig:
	@echo 'Deploy git config'
	$(shell ln -s `pwd`/gitconfig ~/.gitconfig)

~/.hgrc:
	@echo 'Deploy mercurial config'
	$(shell ln -s `pwd`/hgrc ~/.hgrc)

~/.vim:
	@echo 'Deploy vim config'
	$(shell ln -s `pwd`/vim/vim ~/.vim)
	$(shell ln -s `pwd`/vim/vimrc ~/.vimrc)
	$(shell ln -s `pwd`/vim/gvimrc ~/.gvimrc)

clean:
	@echo 'Remove git config'
	$(shell rm -rf ~/.gitconfig)
	$(shell rm -rf ~/.hgrc)
	$(shell rm -rf ~/.vim)
	$(shell rm -rf ~/.vimrc)
	$(shell rm -rf ~/.gvimrc)

.PHONY: clean help

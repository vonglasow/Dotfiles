help:
	@echo "make all\t -> Install git config, vim config, mercurial config, zsh config"
	@echo "make vim\t -> Install vim config"
	@echo "make remove-vim\t -> Remove vim config"
	@echo "make hg\t\t -> Install mercurial config"
	@echo "make remove-hg\t -> Remove mercurial config"
	@echo "make git\t -> Install git config"
	@echo "make remove-git\t -> Remove git config"
	@echo "make zsh\t -> Install zsh config"
	@echo "make remove-zsh\t -> Remove zsh config"
	@echo "make clean\t -> Remove all config deploy"
	@echo "make help\t -> Display this help"

all: git hg vim zsh

git: ~/.gitconfig
hg: ~/.hgrc
vim: ~/.vim ~/.vimrc ~/.gvimrc
zsh: ~/.zprezto

~/.gitconfig:
	@echo 'Deploy git config'
	$(shell ln -s `pwd`/gitconfig ~/.gitconfig)

~/.hgrc:
	@echo 'Deploy mercurial config'
	$(shell ln -s `pwd`/hgrc ~/.hgrc)

~/.gvimrc:
	$(shell ln -s `pwd`/vim/gvimrc ~/.gvimrc)

~/.vimrc:
	$(shell ln -s `pwd`/vim/vimrc ~/.vimrc)

~/.vim:
	@echo 'Deploy vim config'
	$(shell ln -s `pwd`/vim/vim ~/.vim)

~/.zprezto:
	@echo 'Deploy zsh config'
	$(shell git clone --recursive https://github.com/sorin-ionescu/prezto.git `pwd`/../prezto)
	$(shell ln -s `pwd`/../prezto ~/.zprezto)

remove-hg:
	@echo 'Remove Mercurial'
	$(shell rm -rf ~/.hgrc)

remove-git:
	@echo 'Remove Git config'
	$(shell rm -rf ~/.gitconfig)

remove-vim:
	@echo 'Remove Vim config'
	$(shell rm -rf ~/.vimrc)
	$(shell rm -rf ~/.vim)
	$(shell rm -rf ~/.gvimrc)

remove-zsh:
	@echo 'Remove Zsh config'
	$(shell rm -rf ~/.zlogin)
	$(shell rm -rf ~/.zlogout)
	$(shell rm -rf ~/.zprezto)
	$(shell rm -rf ~/.zpreztorc)
	$(shell rm -rf ~/.zprofile)
	$(shell rm -rf ~/.zshenv)
	$(shell rm -rf ~/.zshrc)

clean: remove-hg remove-git remove-vim remove-zsh

.PHONY: clean help remove-hg remove-git remove-vim remove-zsh vim git hg zsh


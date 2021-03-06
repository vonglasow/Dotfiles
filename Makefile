GREP := grep
VGREP:= $(GREP) -Ev
AWK  := awk
SORT := sort

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	PR   := pr --omit-pagination --width=80 --columns=4
	GREPSTRING := Makefile
endif
ifeq ($(UNAME_S),Darwin)
	PR   := pr -4 -t -w 80
	GREPSTRING := 'Makefile|0x1F5:0:9'
endif

help:
	@make -pq | 									\
	$(VGREP) $(GREPSTRING) |						\
	$(AWK) '/(^[^.%][-A-Za-z0-9_]*):/ 				\
		{ print substr($$1, 1, length($$1)-1) }' | 	\
	$(SORT) | $(PR)

all: git hg vim zsh tmux fzf

git: ~/.gitconfig ~/.gitalias
hg: ~/.hgrc
vim: ~/.vim ~/.vimrc ~/.gvimrc
zsh: ~/.zprezto
tmux: ~/.tmux.conf
fzf: ~/.fzf

~/.gitconfig:
	@echo 'Deploy git config'
	ln -s $(CURDIR)/gitconfig $@

~/.gitalias:
	ln -s $(CURDIR)/gitalias $@

~/.hgrc:
	@echo 'Deploy mercurial config'
	ln -s $(CURDIR)/hgrc $@

~/.gvimrc:
	ln -s $(CURDIR)/vim/gvimrc $@

~/.vimrc:
	ln -s $(CURDIR)/vim/vimrc $@

~/.vim:
	@echo 'Deploy vim config'
	ln -s $(CURDIR)/vim/vim $@
	git submodule update --init --recursive

~/.zprezto:
	@echo 'Deploy zsh config'
	git clone --recursive https://github.com/vonglasow/prezto.git $(CURDIR)/../prezto
	ln -s $(CURDIR)/../prezto ~/.zprezto
	ln -s $(CURDIR)/../prezto/runcoms/zlogin ~/.zlogin
	ln -s $(CURDIR)/../prezto/runcoms/zlogout ~/.zlogout
	ln -s $(CURDIR)/../prezto/runcoms/zpreztorc ~/.zpreztorc
	ln -s $(CURDIR)/../prezto/runcoms/zprofile ~/.zprofile
	ln -s $(CURDIR)/../prezto/runcoms/zshenv ~/.zshenv
	ln -s $(CURDIR)/../prezto/runcoms/zshrc ~/.zshrc

~/.tmux.conf:
	@echo 'Deploy tmux config'
	ln -s $(CURDIR)/tmux $@

~/.fzf:
	@echo 'Deploy fzf config'
	ln -s $(CURDIR)/fzf $@
	y y | ~/.fzf/install

remove-hg:
	@echo 'Remove Mercurial'
	rm -rf ~/.hgrc

remove-git:
	@echo 'Remove Git config'
	rm -rf ~/.gitconfig

remove-vim:
	@echo 'Remove Vim config'
	rm -rf ~/.vimrc
	rm -rf ~/.vim
	rm -rf ~/.gvimrc

remove-zsh:
	@echo 'Remove Zsh config'
	rm -rf ~/.zlogin
	rm -rf ~/.zlogout
	rm -rf ~/.zprezto
	rm -rf ~/.zpreztorc
	rm -rf ~/.zprofile
	rm -rf ~/.zshenv
	rm -rf ~/.zshrc
	rm -rf $(CURDIR)/../prezto

remove-tmux:
	@echo 'Remove Tmux config'
	rm -rf ~/.tmux.conf

remove-fzf:
	@echo 'Remove fzf config'
	~/.fzf/uninstall
	rm -rf ~/.fzf

clean: remove-hg remove-git remove-vim remove-zsh remove-tmux

.PHONY: clean help remove-hg remove-git remove-vim remove-zsh vim git hg zsh tmux


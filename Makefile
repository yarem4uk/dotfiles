user:
	./user.sh
root:
	sudo ./root.sh
vim:
	./vim_setup

all:
	nvim-install ubuntu-prepare

nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/init.vim ~/.config/nvim/init.vim | true
	ln -s $(PWD)/vim/abbreviations.vim ~/.config/nvim/abbreviation.vim | true

ubuntu-prepare:
	apt-get install update | true
	apt-get install neovim curl | true

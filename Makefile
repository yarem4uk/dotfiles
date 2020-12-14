user:
	./user.sh
root:
	sudo ./root.sh
vim:
	./vim_setup

all: bash-setup nvim-install ubuntu-prepare

bash-setup:
	ln -s $(PWD)/files/bashrc ~/.bashrc | true
	ln -s $(PWD)/files/aliases ~/.aliases | true

nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/init.vim ~/.config/nvim/init.vim | true
	ln -s $(PWD)/vim/abbreviations.vim ~/.config/nvim/abbreviations.vim | true

ubuntu-prepare:
	apt-get install -y neovim curl

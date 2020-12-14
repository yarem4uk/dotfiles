user:
	./user.sh
root:
	sudo ./root.sh
vim:
	./vim_setup
nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/init.vim ~/.config/nvim/init.vim | true

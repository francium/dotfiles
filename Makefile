install:
	stow \
		bash \
		bin \
		code \
		gitconfig \
		inputrc \
		nautilus \
		npm \
		nvim \
		mpv \
		ranger \
		tmux \
		zathura


uninstall:
	stow -D \
		bash \
		bin \
		code \
		gitconfig \
		inputrc \
		nautilus \
		npm \
		nvim \
		mpv \
		ranger \
		tmux \
		zathura


update:
	make .update && make .vim-init && make .tmux-init


.update:
	git fetch
	git merge origin/master
	make uninstall
	make install


.vim-init:
	nvim '+PlugUpgrade | PlugInstall | PlugUpdate | qall'


.tmux-init:
	~/.tmux/plugins/tpm/scripts/install_plugins.sh

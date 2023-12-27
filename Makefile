install:
	stow \
		alacritty \
		bash \
		bat \
		bin \
		dot-desktop \
		gitconfig \
		guile \
		inputrc \
		nautilus \
		npm \
		nvim \
		nvim-lua \
		mpv \
		profile-sync-daemon \
		python \
		ranger \
		ripgrep \
		tmux \
		vivid \
		xournalpp \
		zathura


uninstall:
	stow -D \
		alacritty \
		bash \
		bat \
		bin \
		dot-desktop \
		gitconfig \
		guile \
		inputrc \
		nautilus \
		npm \
		nvim \
		nvim-lua \
		mpv \
		profile-sync-daemon \
		python \
		ranger \
		ripgrep \
		tmux \
		vivid \
		xournalpp \
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

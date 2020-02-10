install:
	stow \
		bash \
		bin \
		code \
		gitconfig \
		nvim \
		mpv \
		ranger \
		tmux \
		zathura


update:
	make .update && make .vim-init && make .tmux-init

update:
	git pull && \
		make uninstall && \
		make install


uninstall:
	stow -D \
		bash \
		bin \
		code \
		gitconfig \
		nvim \
		mpv \
		ranger \
		tmux \
		zathura


vim-init:
	vim '+PlugUpgrade | PlugInstall | PlugUpdate | qall'


# TODO: Can't seem to call the `update_plugins` script directly, it relies on
# internal variables to be set, which aren't when you call it directly
tmux-init:
	~/.tmux/plugins/tpm/bindings/install_plugins
	# ~/.tmux/plugins/tpm/bindings/update_plugins all

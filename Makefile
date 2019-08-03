install:
	stow \
		bash \
		code \
		gitconfig \
		nvim \
		mpv \
		ranger \
		sway \
		tmux \
		zathura

update:
	git pull && \
		make uninstall && \
		make install

uninstall:
	stow -D \
		bash \
		code \
		gitconfig \
		nvim \
		mpv \
		ranger \
		sway \
		tmux \
		zathura

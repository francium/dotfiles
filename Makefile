install:
	stow \
		bash \
		code \
		gitconfig \
		nvim \
		mpv \
		ranger \
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
		tmux \
		zathura

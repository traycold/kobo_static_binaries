#!/bin/sh

wget -qO- https://www.nano-editor.org/dist/v2.9/nano-2.9.5.tar.xz | tar xJ --strip-components=1
wget -qO- https://invisible-mirror.net/archives/ncurses/ncurses-6.1.tar.gz | tar xz --strip-components=1 -C ncurses




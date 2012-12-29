less-tree-watch
===============

Simple command-line tool for watching and compiling LESS files recursively in a directory tree

##Installation

Run ``sudo npm install less-tree-watch -g`` to install globally

##Usage

``less-watch [less-options] [dir-in] [dir-out]``


Examples

``less-watch less css`` Watch ./less/ directory and output in ./css/

``less-watch -x --yui-compress less css`` Adds options to ``lessc`` execution

Nice and simple

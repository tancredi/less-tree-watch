less-tree-watch
===============

Simple command-line tool for watching and compiling LESS files recursively in a directory tree

##Command-line usage

Run ``sudo npm install less-tree-watch -g`` to install globally

``less-tree-watch [less-options] [dir-in] [dir-out]`` Watches a LESS tree
``less-tree-compile [less-options] [dir-in] [dir-out]`` Compiles just once a LESS tree

Examples

``less-tree-watch less css`` Watch ./less/ directory and output in ./css/
``less-tree-watch less css --yui-compress`` Compile and compresses ./less/ directory and output in ./css/ 
``less-tree-watch -x --yui-compress less css`` Adds options to ``lessc`` execution

Nice and simple

##Node usage

Run ``npm install less-tree-watch`` to install

Require and intanciate the watcher with the desired arguments:
```
var LessTreeWatcher = require('less-tree-watch').LessTreeWatcher;
watcher = new LessTreeWatcher('less', 'css', [ '-x', '--yui-compress' ]);
```

Now you can run ``watcher.watchTree()`` to watch your LESS tree or ``watcher.compileTree()`` to just compile once.
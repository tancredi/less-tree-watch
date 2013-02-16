LessTreeWatcher = require('../index').LessTreeWatcher

args = process.argv.slice 2
outDir = args[args.length - 1]
watchDir = args[args.length - 2]

new LessTreeWatcher(watchDir, outDir, args).compileTree()
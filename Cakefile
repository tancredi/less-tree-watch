fs = require 'fs'

{print} = require 'util'
{spawn} = require 'child_process'

task 'build', 'Compiling', ->

    coffee = spawn 'coffee', ['-c', '--bare', '--shebang', 'node', '-o', 'lib/', 'src/']
    coffee.stderr.on 'data', (data) ->
        process.stderr.write data.toString()
    coffee.stdout.on 'data', (data) ->
        print data.toString()

task 'watch', 'Watching for changes...', ->

    coffee = spawn 'coffee', ['-cw', '--bare', '-o', 'lib/', 'src/']
    coffee.stderr.on 'data', (data) ->
        process.stderr.write data.toString()
    coffee.stdout.on 'data', (data) ->
        print data.toString()
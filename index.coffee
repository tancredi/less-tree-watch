#!/usr/bin/env coffee

exec = require('child_process').exec
path = require 'path'
fs = require 'fs'
watch = require 'watch'
findit = require 'findit'
colors = require 'cli-color'

allowedOptions = [
    [ '-c', 'compress' ]
]

INPUT_EXT = 'less'
OUTPUT_EXT = 'css'

class LessTreeWatcher

    constructor: (@watchDir, @outDir, @args = []) ->
        @options = []
        @parseOptions()

        if @outDir.substr(-1) isnt '/' then @outDir += '/'
        if @watchDir.substr(-1) isnt '/' then @watchDir += '/'

    compileTree: =>
        console.log colors.yellow "Clearing out '#{@outDir}'"
        @clearAll()
        console.log colors.blue.bold("Recompiling all in '#{@watchDir}") + colors.white " - #{new Date().toString()}"
        files = findit.sync @watchDir
        for file in files
            segments = file.split '/'
            filename = segments[segments.length - 1]
            if filename.substr(0, 1) isnt '_' and filename.substr(-INPUT_EXT.length) is INPUT_EXT
                @compile file.substr @watchDir.length

    watchTree: =>
        watch.watchTree @watchDir, @compileTree

    parseOptions: =>
        for opt in allowedOptions
            found = @args.indexOf(opt[0]) isnt -1
            @options[opt[1]] = found

    clearAll: =>
        files = findit.sync @outDir
        for file in files
            if file.substr(-OUTPUT_EXT.length) is OUTPUT_EXT
                fs.unlinkSync file

    compile: (filename) =>
        pureFilename = filename.substr 0, filename.length - INPUT_EXT.length
        outFilename = "#{pureFilename}#{OUTPUT_EXT}"
        command = "lessc #{@watchDir}#{filename} #{@outDir}#{outFilename} #{@args.join(' ')}"
        console.log colors.green.bold("Compiling #{@watchDir}#{filename}") + colors.white " - Command: '#{command}'"
        exec command, (error, stdout, stderr) ->
            if error?
                console.log "exec error: #{error}"
                console.log "stdout: #{stdout}"
                console.log "stderr: #{stderr}"

module.exports = LessTreeWatcher: LessTreeWatcher

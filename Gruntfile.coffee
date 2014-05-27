module.exports = (grunt) ->

  @initConfig
    pkg: grunt.file.readJSON 'package.json'
    jekyll:
      build: true
    watch:
      html:
        files: ['*.html']
        tasks: ['jekyll:build']
      gruntfile:
        files: ['Gruntfile.coffee']
        tasks: ['jekyll:build']

  @loadNpmTasks 'grunt-jekyll'
  @loadNpmTasks 'grunt-contrib-watch'

  # Default task(s).
  @registerTask 'default', [], =>
    @log.write('Running default tasks...').ok()
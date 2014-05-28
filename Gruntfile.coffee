module.exports = (grunt) ->

  @initConfig
    pkg: grunt.file.readJSON 'package.json'
    jekyll:
      build: true
      serve: true
    connect:
      server:
        options:
          base: '_site'
    watch:
      livereload:
        options:
          livereload: true
        files: ['*.html']
        tasks: ['connect','jekyll:serve']

    copy:
      css:
        expand: true
        flatten: true
        src: [
          'bower_components/bootstrap/dist/css/*.min.css',
          'bower_components/fontawesome/css/*.min.css'
        ]
        dest: 'app/css/'
      js:
        expand: true
        flatten: true
        src: 'bower_components/bootstrap/dist/js/*.min.js'
        dest: 'app/js/'
      fonts:
        expand: true
        flatten: true
        src: 'bower_components/fontawesome/fonts/*'
        dest: 'app/fonts/'

  @loadNpmTasks 'grunt-jekyll'
  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-contrib-connect'
  @loadNpmTasks 'grunt-contrib-copy'

  # Default task(s).
  @registerTask 'default', ['copy', 'connect', 'watch']
module.exports = (grunt) ->

  @initConfig
    pkg: grunt.file.readJSON 'package.json'
    jekyll:
      build:
        options:
          serve: false
          build: true
    connect:
      server:
        options:
          base: '_site'
          open: true
    watch:
      options:
        livereload: true
      html:
        files: [
          'app/*.html'
          'app/**/*.html'
        ]
        tasks: ['build']
      less:
        files: [
          'app/less/*'
        ]
        tasks: ['build']
      config:
        files: [
          '_config.yml'
        ]
        tasks: ['build']
      grunt:
        files: ['Gruntfile.coffee']
    copy:
      js:
        expand: true
        flatten: true
        src: 'vendor/bootstrap/dist/js/*.min.js'
        dest: 'app/js/'
      fonts:
        expand: true
        flatten: true
        src: 'vendor/fontawesome/fonts/*'
        dest: 'app/fonts/'
    less:
      build:
        options:
          path: ['less']
        files:
          'app/css/styles.css': 'app/less/styles.less'
    clean:
      build: ['app/css', 'app/fonts']

  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-contrib-connect'
  @loadNpmTasks 'grunt-contrib-copy'
  @loadNpmTasks 'grunt-contrib-less'
  @loadNpmTasks 'grunt-contrib-clean'
  @loadNpmTasks 'grunt-jekyll'

  # Default task(s).
  @registerTask 'default', ['build', 'serve']
  @registerTask 'serve', ['connect:server', 'watch']
  @registerTask 'build', ['clean', 'less:build', 'copy', 'jekyll:build']

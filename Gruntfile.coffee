module.exports = (grunt) ->

  @initConfig
    pkg: grunt.file.readJSON 'package.json'
    jekyll:
      build:
        options:
          serve: false
          build: true
      watch:
        options:
          serve: false
          build: true
          watch: true
    connect:
      server:
        options:
          base: '_site'
          open: true
    clean:
      build: ['css', 'fonts', 'images/me-*.jpg']
    watch:
      options:
        livereload: true
      less:
        files: [
          'less/*'
        ]
        tasks: ['less']
    less:
      build:
        options:
          path: ['less']
          cleancss: true
        files:
          'css/styles.css': 'less/styles.less'
    cssmin:
      options:
        shorthandCompacting: false
        roundingPrecision: -1
      target:
        files:
          'css/styles.min.css': ['css/styles.css']

    images:
      create:
        options:
          sizes: [
            name: 'small',
            width: 130
          ]
        files: [
          {
            src: 'images/me.jpg', dest: 'images/me.jpg'
          }
        ]

  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-contrib-connect'
  @loadNpmTasks 'grunt-contrib-cssmin'
  @loadNpmTasks 'grunt-contrib-less'
  @loadNpmTasks 'grunt-contrib-clean'
  @loadNpmTasks 'grunt-jekyll'

  # Default task(s).
  @registerTask 'default', ['develop']
  @registerTask 'develop', ['clean', 'less', 'serve']
  @registerTask 'serve', ['connect:server', 'watch']
  @registerTask 'publish', ['clean', 'images', 'less', 'jekyll:build']

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
          '*.html'
          '**/*.html'
        ]
        tasks: ['build']
      less:
        files: [
          'less/*'
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
        dest: 'js/'
      fonts:
        expand: true
        flatten: true
        src: 'vendor/fontawesome/fonts/*'
        dest: 'fonts/'
    responsive_images:
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
    less:
      build:
        options:
          path: ['less']
        files:
          'css/styles.css': 'less/styles.less'
    clean:
      build: ['css', 'fonts', 'images/me-*.jpg']

  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-contrib-connect'
  @loadNpmTasks 'grunt-contrib-copy'
  @loadNpmTasks 'grunt-contrib-less'
  @loadNpmTasks 'grunt-contrib-clean'
  @loadNpmTasks 'grunt-jekyll'
  @loadNpmTasks 'grunt-responsive-images'

  # Default task(s).
  @registerTask 'default', ['build', 'serve']
  @registerTask 'serve', ['connect:server', 'watch']
  @registerTask 'build', ['clean', 'less:build', 'copy', 'responsive_images:create', 'jekyll:build']

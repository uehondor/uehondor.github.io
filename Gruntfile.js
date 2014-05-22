module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
      pkg: grunt.file.readJSON('package.json'),
      jekyll: {
        serve: {
          options: {
            dest: '.jekyll'
          }
        }
      }
  });

  grunt.loadNpmTasks('grunt-jekyll');

  // Default task(s).
  grunt.registerTask('default', []);

};
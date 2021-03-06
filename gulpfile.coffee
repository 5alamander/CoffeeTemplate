gulp = require('gulp')
gutil = require('gulp-util')
coffee = require('gulp-coffee')

gulp.task 'coffee', ->
  gulp.src './src/*.coffee'
    .pipe coffee({bare: true}).on('error', gutil.log)
    .pipe gulp.dest('./dest/')

gulp.task 'default', ['coffee']

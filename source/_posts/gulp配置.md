---
title: gulp配置
date: 2017-08-17 18:41:33
tags:
---
### gulp配置文件的一些配置参考
定义一个个task，通过pipe管道，
完成一些列任务的执行。
<!-- more -->
``` 
var gulp = require('gulp'),
gulpif = require('gulp-if'),
useref = require('gulp-useref'),
minifyCss = require('gulp-minify-css'),
uglify = require('gulp-uglify'),
rev = require('gulp-rev'),
revCollector = require('gulp-rev-collector'),
minifyHTML = require('gulp-minify-html'),
clean = require('gulp-clean');
//引入gulp-babel模块，用于转换ES6为ES5
var babel = require('gulp-babel');

gulp.task('useref', function() {
    return gulp.src('src/*.html')
        .pipe(useref())
        .pipe(gulpif('*.js', uglify()))
        .pipe(gulpif('*.css', minifyCss()))
        .pipe(gulp.dest('dist'));
});

gulp.task('images', function() {
    return gulp.src('src/img/**/*')
        .pipe(gulp.dest('dist/img'));
});


gulp.task('css',['useref'], function () {
    return gulp.src('dist/css/*.css')
        .pipe(rev())
        .pipe(gulp.dest('dist/css'))
        .pipe( rev.manifest() )
        .pipe( gulp.dest( 'rev/css' ) );
});

gulp.task('es6', function() {
    return gulp.src('src/es6/*.js')
         .pipe(babel({
              presets: ['es2015','stage-0']
         }))
     .pipe(gulp.dest('src/js/'));
});
gulp.task('watch', ['es6'], function() {
    gulp.watch(['src/es6/*.js'], ['es6']);
});

gulp.task('scripts',['useref'], function () {
    return gulp.src('dist/js/*.js')
        .pipe(rev())
        .pipe(gulp.dest('dist/js'))
        .pipe( rev.manifest() )
        .pipe( gulp.dest( 'rev/js' ) );
});

gulp.task('rev1',['css', 'scripts'], function () {
    return gulp.src(['rev/**/*.json', 'dist/*.html'])
        .pipe(useref())
        .pipe( revCollector({
            replaceReved: true,
            dirReplacements: {
                'css': 'css',
                'js': 'js',
                'cdn/': function(manifest_value) {
                    return '//cdn' + (Math.floor(Math.random() * 9) + 1) + '.' + 'exsample.dot' + '/img/' + manifest_value;
                }
            }
        }) )
        .pipe( minifyHTML({
            empty:true,
            spare:true
        }) )
        .pipe( gulp.dest('dist') );
});

gulp.task('clean',function(){
    return gulp.src('./dist').pipe(clean());
})
//gulp.task('default',['useref','images','css','scripts', 'rev1']);
//gulp.task('rev',['css','scripts']);

gulp.task('default',['clean'],function(){
    gulp.start('useref','images','css','scripts', 'rev1');
}); ```
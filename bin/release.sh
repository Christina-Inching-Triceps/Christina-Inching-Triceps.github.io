#!/bin/bash

angularDir=./src/github-pages

build_release() {
  cd $angularDir
  yarn run build
  cd ../..
  cp -pr $angularDir/dist/github-pages/* .
}

build_release

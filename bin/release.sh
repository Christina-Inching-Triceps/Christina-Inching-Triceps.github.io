#!/bin/bash

angularDir=./src/github-pages

build_release() {
  cd $angularDir

  if type "コマンド" > /dev/null 2>&1; then
    yarn global add @angular/cli
  fi

  yarn install
  yarn run build

  cd ../..
  cp -pr $angularDir/dist/github-pages/* .
}

build_release

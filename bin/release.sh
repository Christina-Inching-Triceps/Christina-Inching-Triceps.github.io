#!/bin/bash

angularDir=./src/github-pages

build_release() {
  # buildのためにangularプロジェクトフォルダへ移動
  cd $angularDir

  # buildに必要なものを用意
  if type "ng" > /dev/null 2>&1; then
    yarn global add @angular/cli
  fi
  yarn install

  # build
  yarn run build  --prod --output-hashing=none

  # 元のフォルダ(プロジェクトルート)に戻る
  cd -
  # 過去にアップロードされたファイルを削除
  rm main-es* polyfills-es* runtime-es* styles.* 3rdpartylicenses.txt index.html favicon.ico

  # ファイル強制配置
  \cp -pfr $angularDir/dist/github-pages/* .
}

build_release

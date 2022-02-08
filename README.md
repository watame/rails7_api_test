# rails7_api_test
rails7のAPIモードテスト用プロジェクト

# 環境
Dockerで環境構築を行う
* Ruby: 3.1.0
* Rails: 7.0.1

## 環境構築手順
1. `docker run --rm -v `pwd`:/rails7_api_test -w /rails7_api_test ruby:3.1.0 bundle init`
2. Dockerfile作成
  * 内容はDockerfileを確認する
4. `docker build -t rails7_api_test .`
5. `docker run --rm -v `pwd`:/rails7_api_test rails7_api_test rails new . --api –skip-bundle --skip-test --skip-turbolinks -O`
  * DBは不要なので`-O`でActiveRecordを利用しないようにする
6. docker-compose.yml作成
  * 内容はdocker-composet.ymlを確認する
7. `docker-compose build`

## Docker起動手順
1. `docker-compose up`
2. `localhost:3000`にアクセスすればサーバーへアクセス可能
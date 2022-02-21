# rails7_api_test
rails7のAPIモードテスト用プロジェクト

# 環境
Dockerで環境構築を行う
* Ruby: 3.1.0
* Rails: 7.0.1

## 環境構築手順
1. GitHubでレポジトリを作成
2. `git clone <レポジトリURI>`　でローカルにクローン
3. `cd <レポジトリ名>`でクローンしたレポジトリへ移動
4. ```docker run --rm -v `pwd`:/rails7_api_test -w /rails7_api_test ruby:3.1.0 bundle init```
    * 作成されたGemfileの`#gem rails`のコメントを外しておく
5. Dockerfile作成
    * 内容はDockerfileを確認する
6. `docker build -t rails7_api_test .`
7. ```docker run --rm -v `pwd`:/rails7_api_test rails7_api_test rails new . --api –skip-bundle --skip-test --skip-turbolinks -O```
    * DBは不要なので`-O`でActiveRecordを利用しないようにする
8. docker-compose.yml作成
    * 内容はdocker-composet.ymlを確認する
9. `docker-compose build`

## Docker起動手順
1. `docker-compose up`
2. `localhost:3000`にアクセスすればサーバーへアクセス可能

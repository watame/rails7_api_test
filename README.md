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
    * **このタイミングでは`FROM ruby:3.1.0-slim`ではなく`FROM ruby:3.1.0`を利用する**
6. `docker build -t rails7_api_test .`
7. ```docker run --rm -v `pwd`:/rails7_api_test rails7_api_test rails new . --api –skip-bundle --skip-test --skip-turbolinks -O```
    * DBは不要なので`-O`でActiveRecordを利用しないようにする
8. docker-compose.yml作成
    * 内容はdocker-composet.ymlを確認する
9. `docker-compose build`

## Docker起動手順
1. `docker-compose up`
2. `localhost:3000`にアクセスすればサーバーへアクセス可能

## DevContainer起動方法
1. ①->②の順にコマンドを選択し、コンテナを起動する
    * ![image](https://user-images.githubusercontent.com/16306537/159122332-0e2a92a6-c4ad-4511-8d30-39cd669d4fd9.png)
2. `rdbg`のプロセスにRails serverを紐づけて起動する
    * `rm -f tmp/pids/server.pid && rdbg --command --open -- bin/rails s -p 3000 -b 0.0.0.0`
3. ①->②の順にコマンドを選択し、rdbgにアタッチし、Rails server を起動させる
    * ![image](https://user-images.githubusercontent.com/16306537/159122725-2885951d-bd8c-4bba-a9ad-61709017f595.png)
4. 実行後、[再生]ボタンを押下していけばサーバーが起動する
    * ![image](https://user-images.githubusercontent.com/16306537/159122931-5329d480-8d53-47cd-8846-38e1e9c3c084.png)
5. ポートが解放されていたら、Rails serverが起動している
    * ![image](https://user-images.githubusercontent.com/16306537/159123015-d538852b-c5dc-414f-a5c1-ee385d00e9e3.png)
6. `localhost:3000`にアクセスすればサーバーが起動している
    * ![image](https://user-images.githubusercontent.com/16306537/159123055-4ca0027a-0a58-4b84-9c02-1f08aad5a127.png)

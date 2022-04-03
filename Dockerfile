FROM ruby:3.1.0-slim

# 公開するポートを明示的に定義
EXPOSE 8000

# 環境変数の設定
ENV APP_ROOT=/rails7_api_test \
    LANG=ja_JP.UTF-8 \
    LC_CTYPE=ja_JP.UTF-8 \
    TZ=Asia/Tokyo

# 最低限必要なライブラリを取得する
# https://qiita.com/tomtang/items/4c8e7c5ae8e90230f907
RUN apt-get update -qq && \
    apt-get install -y build-essential

# debian 環境の場合、curl を利用すると `gpg: no valid OpenPGP data found.` というエラーが出るので wget でインストール
# https://zenn.dev/junki555/articles/2de6024a191913
RUN apt-get install -y wget apt-transport-https && \
    wget --quiet -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# 作業ディレクトリを指定し、Gemfile をコピー
WORKDIR ${APP_ROOT}
COPY ./Gemfile* ${APP_ROOT}/

# Gemfile の定義を Image に反映させる
RUN bundle install -j4 --retry 3

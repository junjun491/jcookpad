# Rubyをインストール
FROM ruby:2.7.2

# Node.jsをインストール
RUN curl -sL RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt install nodejs

# 公式では以下のコマンドを推奨しているが、Node.jsのバージョンが低くてBootstrapが使えない
# RUN apt-get update -qq && apt-get install -y nodejs

# Yarnをインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && apt install yarn

# 環境変数を設定
ENV APP_HOME /eiyorecipe

# ディレクトリの作成と移動
WORKDIR $APP_HOME

# ホストのGemfileなどをコンテナへコピー
COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

# BundlerでGemをインストール
RUN bundle install
RUN gem install racc

RUN bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"


# Webpackerをインストール
RUN rails webpacker:install
ADD . /eiyorecipe

# BundlerでGemをインストール
RUN bundle install


# マウントできるように公開
VOLUME $APP_HOME/public
VOLUME $APP_HOME/tmp

# Railsサーバを準備
RUN ["bundle", "exec", "rails", "webpacker:install:vue"]
RUN ["bundle", "exec", "rails", "webpacker:compile"]
RUN ["apt-get", "-y", "install", "vim"]

# コンテナ起動時にRailsサーバを起動
CMD ["bundle", "exec", "rails", "server", "--environment", "production"]

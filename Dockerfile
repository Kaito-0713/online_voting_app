# ベースイメージ（HerokuでサポートされるRuby）
FROM ruby:2.7.7

# Node.js と Yarn のインストール（Rails用）
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs yarn postgresql-client build-essential libpq-dev

# 作業ディレクトリ
WORKDIR /app

# Gemfile をコピーして bundle install
COPY Gemfile* ./
RUN bundle install

# アプリのコードをコピー
COPY . .

# ポート番号を指定
EXPOSE 3000

# デフォルトの起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]

# 1. ベースイメージの指定
ARG NODE_VERSION=24-alpine
FROM node:${NODE_VERSION}

# 2. git のインストール (Alpineには標準で入っていないため)
RUN apk add --no-cache git

WORKDIR /app

# 3. git clone を実行
# ここで URL を直接指定します
RUN git clone https://github.com/あなたのユーザー名/リポジトリ名.git .

# 4. 依存関係のインストール
RUN npm install

# 5. 所有者の変更 (nodeユーザーがファイルを扱えるようにする)
RUN chown -R node:node /app
USER node

EXPOSE 5173

# 6. 起動設定
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

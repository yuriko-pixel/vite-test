# バージョンはメジャー指定がおすすめ
ARG NODE_VERSION=24-alpine
FROM node:${NODE_VERSION}

WORKDIR /app

# 先にパッケージ管理ファイルだけコピー（キャッシュを効かせる）
COPY package*.json ./
RUN npm install

# 残りのファイルをコピー。同時に所有者を node ユーザーに変更
COPY --chown=node:node . .

# 以降のコマンドは node ユーザーで実行
USER node

EXPOSE 5173

# Viteの起動設定
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

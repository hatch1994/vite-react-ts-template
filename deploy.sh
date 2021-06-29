#!/usr/bin/env sh

# 发生任何错误终止
set -e

# 构建
npm run build

# 进入输出产物文件夹
cd dist

#如果要部署到自定义域名
# echo 'wwww.example.com' > CNAME

git init
git add -A
git commit -m 'deploy(部署)'

# 如果你要部署在 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# 如果你要部署在 https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd -

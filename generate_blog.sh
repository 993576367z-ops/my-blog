#!/bin/bash
# 自动生成 Hugo + PaperMod VPN 博客压缩包

BLOG_NAME="my-vpn-blog"

# 删除旧文件
rm -rf $BLOG_NAME
mkdir -p $BLOG_NAME/content/post
mkdir -p $BLOG_NAME/themes
mkdir -p $BLOG_NAME/static/images

# 写配置文件
cat > $BLOG_NAME/config.toml <<EOL
baseURL = "https://你的用户名.github.io"
title = "VPN技术博客"
theme = "PaperMod"
languageCode = "zh-cn"
enableRobotsTXT = true
paginate = 5
pygmentsUseClasses = true

[params]
author = "你的名字"
ShowReadingTime = true
ShowShareButtons = true
ShowDarkModeToggle = true

[params.giscus]
enable = true
repo = "你的用户名/你的仓库"
repoID = "你的GitHub仓库ID"
category = "Comments"
categoryID = "CommentsCategoryID"
EOL

# 写示例文章
cat > $BLOG_NAME/content/post/vpn-basics.md <<EOL
---
title: "什么是 VPN？基础知识讲解"
date: 2026-03-20
tags: ["VPN","网络安全"]
---

VPN（Virtual Private Network，虚拟专用网络）是一种通过加密技术，在公共网络上建立安全连接的技术。

## VPN 的核心作用
- 保护你的网络数据
- 隐藏真实 IP
- 在公共 Wi-Fi 下保障隐私
EOL

cat > $BLOG_NAME/content/post/vpn-vs-proxy.md <<EOL
---
title: "VPN 和代理有什么区别？"
date: 2026-03-20
tags: ["VPN","代理","网络安全"]
---

VPN 和代理都可以隐藏 IP，但原理不同。

- VPN：加密所有流量
- 代理：通常只转发部分流量
EOL

cat > $BLOG_NAME/content/post/wireguard-vs-openvpn.md <<EOL
---
title: "WireGuard vs OpenVPN 对比"
date: 2026-03-20
tags: ["WireGuard","OpenVPN","VPN"]
---

## WireGuard
新型 VPN 协议，代码少，性能高。

## OpenVPN
传统 VPN 协议，稳定但复杂。
EOL

# 关于页
cat > $BLOG_NAME/content/about.md <<EOL
---
title: "关于我"
---

你好，我是 VPN 技术爱好者，喜欢分享网络安全与隐私保护知识。
EOL

# README
cat > $BLOG_NAME/README.md <<EOL
# VPN 技术博客

基于 Hugo + PaperMod 的专业静态博客。
包含三篇 VPN 示例文章、关于页、Giscus 评论和暗黑模式。
EOL

# 下载 PaperMod 主题
git clone https://github.com/adityatelange/hugo-PaperMod.git $BLOG_NAME/themes/PaperMod

# 打包成 zip
cd ..
zip -r $BLOG_NAME.zip $BLOG_NAME

echo "博客压缩包生成完成: $BLOG_NAME.zip"

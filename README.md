# 用户体验研究作品集网站

一个纯静态的个人作品集网站，零依赖，支持暗色模式，可部署到 GitHub Pages。

## 文件结构

```text
.
├── index.html
├── styles.css
├── main.js
└── README.md
```

## 如何自定义

### 1. 修改个人信息

打开 `index.html`，替换：

- 头像地址
- 姓名
- 首页介绍语
- 关于我内容
- 联系方式

### 2. 修改案例与能力

打开 `main.js`，编辑顶部的 `projects` 和 `skills` 数组。

## 部署到 GitHub Pages

```bash
git add index.html styles.css main.js README.md
git commit -m "feat: 初始化用户体验研究作品集"
git push
```

进入仓库 `Settings -> Pages`：

- Source 选择 `Deploy from a branch`
- Branch 选择 `main`
- 目录选择 `/ (root)`
- 保存

等待部署完成后，在 GitHub Pages 页面查看生成的网站地址并访问。

## 特性

- 响应式布局
- 暗色与亮色主题切换
- 纯静态，无需构建
- 适合作为用户研究、体验策略、设计研究方向的个人作品集

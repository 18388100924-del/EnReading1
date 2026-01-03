# 在浏览器中运行 EnReading 应用

## 方案一: 本地浏览器运行 (推荐 ⭐)

### 步骤 1: 安装 Flutter
```bash
# 使用 Homebrew 安装 (最简单)
brew install --cask flutter

# 验证安装
flutter doctor
```

### 步骤 2: 运行 Web 版本
```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 获取依赖
flutter pub get

# 在 Chrome 浏览器中运行
flutter run -d chrome

# 或在 Safari 中运行
flutter run -d safari

# 或在默认浏览器中运行
flutter run -d web-server --web-port=8080
# 然后访问 http://localhost:8080
```

运行后会自动打开浏览器并加载应用。

---

## 方案二: 构建静态网页文件

如果您想将应用部署到网站或分享给他人:

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 构建 Web 版本
flutter build web

# 构建完成后，静态文件在 build/web/ 目录
# 可以直接用浏览器打开 build/web/index.html
# 或部署到任何 Web 服务器 (GitHub Pages, Netlify, Vercel 等)
```

### 部署到 GitHub Pages (免费)

1. 构建 Web 版本:
```bash
flutter build web --base-href "/EnReading/"
```

2. 推送到 GitHub Pages:
```bash
cd build/web
git init
git add .
git commit -m "Deploy web app"
git branch -M gh-pages
git remote add origin https://github.com/你的用户名/EnReading.git
git push -f origin gh-pages
```

3. 在 GitHub 仓库设置中启用 GitHub Pages，选择 `gh-pages` 分支

4. 访问 `https://你的用户名.github.io/EnReading/`

---

## 方案三: 使用在线 IDE (无需安装)

如果不想安装 Flutter，可以使用在线服务:

1. **DartPad** (适合快速测试):
   - 访问 https://dartpad.dev/
   - 复制代码即可运行
   - 限制: 不支持多文件和某些插件

2. **GitHub Codespaces**:
   - 在 GitHub 仓库中点击 "Code" → "Codespaces"
   - 自动配置 Flutter 环境
   - 在云端运行 `flutter run -d web-server`

---

## Web 版本特性说明

✅ **完全支持的功能**:
- 文档列表和阅读
- 句子翻译显示
- 单词释义弹窗
- 背景色和字体大小调节
- JSON/CSV 文档格式
- 设置持久化保存

⚠️ **限制**:
- PDF 解析在 Web 端可能有性能差异
- 本地存储使用浏览器 LocalStorage
- 需要现代浏览器 (Chrome/Safari/Edge)

---

## 快速命令汇总

```bash
# 1. 安装 Flutter
brew install --cask flutter

# 2. 进入项目目录
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 3. 获取依赖
flutter pub get

# 4. 运行 (三选一)
flutter run -d chrome              # Chrome 浏览器
flutter run -d safari              # Safari 浏览器
flutter run -d web-server          # 任意浏览器，访问 localhost:8080

# 5. 构建静态文件 (可选)
flutter build web
```

---

## 常见问题

**Q: Flutter 安装时间长吗?**
A: 使用 Homebrew 大约 5-10 分钟，会自动配置所有依赖。

**Q: Web 版本性能如何?**
A: Flutter Web 性能很好，您的应用逻辑简单，运行非常流畅。

**Q: 可以在手机浏览器打开吗?**
A: 可以! Flutter Web 支持响应式设计，手机浏览器也能正常使用。

**Q: 不安装 Flutter 能运行吗?**
A: 可以使用方案二，请其他人构建后获取 `build/web` 文件夹，或使用 GitHub Actions 自动构建 Web 版本。

---

## 推荐方案

**最佳方案**: 安装 Flutter + 本地浏览器运行
- 开发便捷，实时预览
- 修改代码后热重载
- 无需部署即可使用

**分享方案**: 构建静态文件 + GitHub Pages
- 免费托管
- 所有人都能访问
- 无需服务器

# 获取 APK 文件的三种方法

## 🚀 方法一：使用 GitHub Actions 自动构建（推荐）

### 步骤：

1. **创建 GitHub 账号**（如果还没有）
   - 访问 [github.com](https://github.com)
   - 注册免费账号

2. **创建新仓库**
   - 点击右上角 "+" → "New repository"
   - 仓库名称：`EnReading`
   - 设置为 Public（公开）
   - 点击 "Create repository"

3. **上传项目到 GitHub**
   
   在终端执行：
   ```bash
   cd /Users/henry/Documents/2026/CodeBuddy/EnReading
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/你的用户名/EnReading.git
   git push -u origin main
   ```

4. **触发自动构建**
   - 推送代码后，GitHub Actions 会自动开始构建
   - 访问仓库页面 → "Actions" 标签
   - 等待构建完成（约 5-10 分钟）

5. **下载 APK**
   - 构建完成后，点击构建任务
   - 在 "Artifacts" 部分找到 `app-release`
   - 点击下载 APK 文件
   - 传输到手机安装

---

## 💻 方法二：使用 Codemagic 在线构建服务

### 步骤：

1. **访问 Codemagic**
   - 网址：[codemagic.io](https://codemagic.io)
   - 使用 GitHub 账号登录（免费）

2. **连接仓库**
   - 添加你的 GitHub 仓库
   - 选择 `EnReading` 项目

3. **配置构建**
   - 选择 Flutter 项目类型
   - 选择 Android 平台
   - 开始构建

4. **下载 APK**
   - 构建完成后直接下载 APK
   - 也可以扫描二维码直接安装

**优点**：
- ✅ 无需本地环境
- ✅ 构建速度快
- ✅ 每月免费 500 分钟构建时间

---

## 👥 方法三：请朋友帮忙构建

### 如果你有朋友会使用 Flutter：

1. **打包项目**
   ```bash
   cd /Users/henry/Documents/2026/CodeBuddy/EnReading
   cd ..
   tar -czf EnReading.tar.gz EnReading/
   ```

2. **发送给朋友**
   - 将 `EnReading.tar.gz` 文件发送给朋友

3. **朋友执行构建**
   ```bash
   tar -xzf EnReading.tar.gz
   cd EnReading
   flutter pub get
   flutter build apk --release
   ```

4. **获取 APK**
   - APK 位置：`build/app/outputs/flutter-apk/app-release.apk`
   - 朋友将这个文件发回给你

---

## 🛠️ 方法四：使用云端开发环境

### 使用 GitHub Codespaces 或 Gitpod：

1. **GitHub Codespaces**（推荐）
   - 在 GitHub 仓库页面点击 "Code" → "Codespaces"
   - 创建新的 Codespace
   - 在云端终端执行：
     ```bash
     flutter pub get
     flutter build apk --release
     ```
   - 下载生成的 APK

2. **Gitpod**
   - 访问：`https://gitpod.io/#https://github.com/你的用户名/EnReading`
   - 自动启动云端开发环境
   - 执行构建命令

---

## 📦 方法五：使用 Docker（适合技术用户）

### 如果你有 Docker：

1. **创建 Dockerfile**（已包含在项目中）

2. **构建容器**
   ```bash
   cd /Users/henry/Documents/2026/CodeBuddy/EnReading
   docker run --rm -v $(pwd):/project -w /project cirrusci/flutter:stable sh -c "flutter pub get && flutter build apk --release"
   ```

3. **获取 APK**
   - 生成在 `build/app/outputs/flutter-apk/app-release.apk`

---

## 🎯 推荐方案对比

| 方法 | 难度 | 时间 | 费用 | 推荐度 |
|------|------|------|------|--------|
| GitHub Actions | ⭐⭐ | 10分钟 | 免费 | ⭐⭐⭐⭐⭐ |
| Codemagic | ⭐ | 5分钟 | 免费 | ⭐⭐⭐⭐⭐ |
| 请朋友帮忙 | ⭐ | 看情况 | 免费 | ⭐⭐⭐⭐ |
| Codespaces | ⭐⭐ | 10分钟 | 免费额度 | ⭐⭐⭐ |
| Docker | ⭐⭐⭐ | 15分钟 | 免费 | ⭐⭐ |

---

## 💡 最简单的方法

**我推荐使用 Codemagic**，因为：
1. ✅ 完全在线，无需安装任何软件
2. ✅ 注册即可使用，非常简单
3. ✅ 构建速度快，5分钟内完成
4. ✅ 可以直接扫码安装到手机

### 快速开始 Codemagic：

1. 访问 [codemagic.io](https://codemagic.io)
2. 用 GitHub 登录
3. 上传你的项目
4. 点击 "Start new build"
5. 等待完成后下载或扫码安装

---

## ❓ 需要帮助？

如果你在任何步骤遇到问题，可以：
- 查看 GitHub Actions 的构建日志
- 参考 Flutter 官方文档
- 或者询问我具体问题

祝你顺利获取 APK！🎉

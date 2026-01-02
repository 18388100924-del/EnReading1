# GitHub Actions 快速命令

## ⚡ 5 分钟快速版

### 前提：
1. 已有 GitHub 账号
2. 已在 GitHub 创建 `EnReading` 仓库（Public）
3. 打开终端

---

## 📋 复制粘贴这些命令

```bash
# 1. 进入项目目录
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 2. 初始化并提交
git init
git add .
git commit -m "Initial commit"

# 3. 连接 GitHub（⚠️ 替换 YOUR_USERNAME 为你的用户名）
git remote add origin https://github.com/YOUR_USERNAME/EnReading.git
git branch -M main

# 4. 推送（会要求输入用户名和密码/token）
git push -u origin main
```

---

## 🔑 如果需要 Personal Access Token

### 快速创建 Token：

1. **访问**：https://github.com/settings/tokens/new
2. **填写**：
   - Note: `EnReading`
   - Expiration: `90 days`
   - 勾选: `repo` (全选)
3. **点击**："Generate token"
4. **复制** token（只显示一次！）
5. **使用**：在 `git push` 时粘贴作为密码

---

## 🎯 推送后做什么

### 1. 访问 Actions 页面
```
https://github.com/YOUR_USERNAME/EnReading/actions
```

### 2. 等待构建（8-12分钟）

### 3. 下载 APK
- 点击构建任务
- 滚动到底部 "Artifacts"
- 下载 `app-release`
- 解压得到 APK

---

## 📱 传输到手机

### 方法 1：USB
```bash
# 如果安装了 adb
adb install app-release.apk
```

### 方法 2：文件传输
- USB 连接手机
- 复制 APK 到手机
- 在手机上点击安装

---

## 🔄 更新代码后重新构建

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading
git add .
git commit -m "Update"
git push
```

推送后自动重新构建！

---

## ❓ 遇到问题？

### 问题：git command not found
**解决**：
```bash
xcode-select --install
```

### 问题：推送被拒绝
**解决**：
```bash
git pull origin main --rebase
git push
```

### 问题：用户名密码错误
**解决**：使用 Personal Access Token（见上方）

---

## ✅ 一键检查

```bash
# 检查 Git 是否已安装
git --version

# 检查当前目录
pwd

# 检查项目文件
ls -la pubspec.yaml

# 检查 Git 状态
git status

# 查看远程仓库
git remote -v
```

---

## 📞 完整指南

详细步骤请查看：[`GITHUB_ACTIONS_GUIDE.md`](GITHUB_ACTIONS_GUIDE.md)

---

**祝构建顺利！** 🚀

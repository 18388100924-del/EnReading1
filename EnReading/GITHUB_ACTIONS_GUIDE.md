# GitHub Actions 完整操作指南

## 🎯 总览

只需 **5 个步骤**，**10 分钟**就能获得 APK！

---

## 📋 准备工作

### 需要的东西：
- ✅ GitHub 账号（免费）
- ✅ 项目文件夹（已有）
- ✅ 10 分钟时间

### 不需要的东西：
- ❌ 不需要安装 Flutter
- ❌ 不需要安装 Android Studio
- ❌ 不需要任何开发工具

---

## 🚀 步骤 1：注册 GitHub 账号（如果还没有）

### 1.1 访问 GitHub

在浏览器打开：[https://github.com](https://github.com)

### 1.2 注册账号

```
┌─────────────────────────────────────┐
│ GitHub                              │
│                                     │
│ Username: [你的用户名]              │
│ Email:    [你的邮箱]                │
│ Password: [你的密码]                │
│                                     │
│ [Sign up for GitHub]                │
└─────────────────────────────────────┘
```

**操作**：
1. 填写用户名、邮箱、密码
2. 点击 "Sign up for GitHub"
3. 验证邮箱（收到验证邮件后点击链接）

**提示**：如果已有账号，直接点击 "Sign in" 登录

---

## 🚀 步骤 2：创建 GitHub 仓库

### 2.1 创建新仓库

登录 GitHub 后，访问：[https://github.com/new](https://github.com/new)

### 2.2 填写仓库信息

```
┌─────────────────────────────────────┐
│ Create a new repository             │
│                                     │
│ Repository name *                   │
│ [EnReading]  ← 填写这个             │
│                                     │
│ Description (optional)              │
│ [English reading app]               │
│                                     │
│ ● Public   ○ Private                │
│ ↑ 选择 Public（必须）               │
│                                     │
│ Initialize this repository:         │
│ ☐ Add a README file                │
│ ☐ Add .gitignore  ← 都不要勾选     │
│ ☐ Choose a license                 │
│                                     │
│ [Create repository]  ← 点这个       │
└─────────────────────────────────────┘
```

**重要**：
- ✅ 仓库名：`EnReading`
- ✅ 选择 **Public**（公开）
- ❌ **不要**勾选任何初始化选项
- ✅ 点击 "Create repository"

---

## 🚀 步骤 3：上传项目到 GitHub

### 3.1 打开终端

**macOS**：
- 按 `Command + Space`
- 输入 "Terminal"
- 按回车

### 3.2 进入项目目录

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading
```

**验证**：输入 `ls` 应该能看到项目文件（lib、android、pubspec.yaml 等）

### 3.3 初始化 Git

```bash
git init
```

**预期输出**：
```
Initialized empty Git repository in /Users/henry/Documents/2026/CodeBuddy/EnReading/.git/
```

### 3.4 添加所有文件

```bash
git add .
```

**说明**：这会添加所有项目文件到 Git

### 3.5 提交文件

```bash
git commit -m "Initial commit"
```

**预期输出**：
```
[main (root-commit) abc1234] Initial commit
 XX files changed, XXXX insertions(+)
 create mode 100644 pubspec.yaml
 ...
```

### 3.6 连接到 GitHub 仓库

**重要**：将 `你的用户名` 替换成你的 GitHub 用户名！

```bash
git remote add origin https://github.com/你的用户名/EnReading.git
```

**示例**（如果用户名是 henry123）：
```bash
git remote add origin https://github.com/henry123/EnReading.git
```

### 3.7 重命名分支为 main

```bash
git branch -M main
```

### 3.8 推送到 GitHub

```bash
git push -u origin main
```

**第一次推送会要求登录**：

#### 如果使用 HTTPS（推荐）：
```
Username: [你的GitHub用户名]
Password: [你的GitHub密码或Personal Access Token]
```

**注意**：GitHub 现在需要使用 Personal Access Token 代替密码

#### 创建 Personal Access Token：
1. 访问：https://github.com/settings/tokens
2. 点击 "Generate new token" → "Generate new token (classic)"
3. Note: 填写 `EnReading`
4. Expiration: 选择 `90 days`
5. 勾选 `repo` 权限（全部）
6. 点击 "Generate token"
7. **复制生成的 token**（只显示一次！）
8. 在终端密码处粘贴这个 token

**预期输出**：
```
Enumerating objects: XX, done.
Counting objects: 100% (XX/XX), done.
...
To https://github.com/你的用户名/EnReading.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

---

## 🚀 步骤 4：查看自动构建

### 4.1 访问仓库

在浏览器打开：
```
https://github.com/你的用户名/EnReading
```

### 4.2 进入 Actions 标签

```
┌─────────────────────────────────────┐
│ < > Code  Issues  Pull requests     │
│ ⚡ Actions ← 点这个                 │
│ Projects  Wiki  Security  Settings  │
└─────────────────────────────────────┘
```

### 4.3 查看构建进度

你会看到：

```
┌─────────────────────────────────────┐
│ All workflows                        │
│                                      │
│ 🟡 Build Android APK  ← 正在运行    │
│    Initial commit                    │
│    ⏳ Running (2m 30s)               │
│                                      │
└─────────────────────────────────────┘
```

**状态说明**：
- 🟡 黄色圆圈 = 正在运行
- ✅ 绿色对勾 = 构建成功
- ❌ 红色叉号 = 构建失败

### 4.4 查看详细进度

点击 "Build Android APK" 查看详细步骤：

```
✓ Set up job
✓ Run actions/checkout@v3
✓ Run actions/setup-java@v3
⏳ Run subosito/flutter-action@v2
⏸️ Get dependencies
⏸️ Build APK
⏸️ Upload APK
```

**等待时间**：约 8-12 分钟

---

## 🚀 步骤 5：下载 APK

### 5.1 等待构建完成

当所有步骤都显示 ✅ 时，构建完成：

```
┌─────────────────────────────────────┐
│ ✅ Build Android APK                │
│    #1: Initial commit               │
│    ✓ Successful in 9m 23s           │
└─────────────────────────────────────┘
```

### 5.2 点击构建任务

点击 "Build Android APK" 进入详情页

### 5.3 滚动到底部找到 Artifacts

```
┌─────────────────────────────────────┐
│ Artifacts                            │
│                                      │
│ 📦 app-release                      │
│    Uploaded 2 minutes ago           │
│    Expires in 90 days               │
│    12.3 MB                          │
│    [Download] ← 点这个              │
└─────────────────────────────────────┘
```

### 5.4 下载并解压

1. 点击 "Download" 下载 ZIP 文件
2. 解压 ZIP 文件
3. 里面就是 `app-release.apk`

---

## 📱 步骤 6：安装到手机

### 6.1 传输 APK 到手机

**方法 1：USB 数据线**
1. 用 USB 线连接手机到电脑
2. 手机上选择"文件传输"模式
3. 复制 `app-release.apk` 到手机的 Download 文件夹

**方法 2：云盘/微信**
1. 上传 APK 到百度网盘/微信/QQ
2. 手机端下载

**方法 3：ADB（如果熟悉）**
```bash
adb install app-release.apk
```

### 6.2 在手机上安装

1. 打开手机的文件管理器
2. 找到 `app-release.apk`
3. 点击安装
4. 如果提示"禁止安装未知来源"：
   - 打开设置 → 安全
   - 允许"未知来源"或"安装未知应用"
   - 返回继续安装
5. 安装完成！

### 6.3 打开应用

在桌面找到 "EnReading" 图标，点击打开！

---

## 🔄 后续更新

### 如果修改了文档或代码，重新构建：

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 添加修改的文件
git add .

# 提交
git commit -m "Update documents"

# 推送
git push
```

推送后，GitHub Actions 会**自动重新构建**，重复步骤 4-6 即可。

---

## ❓ 常见问题

### Q1: `git push` 时要求输入用户名密码？

**答**：使用 Personal Access Token：
1. 访问 https://github.com/settings/tokens
2. 生成新 token
3. 复制 token
4. 在密码处粘贴 token（不是你的 GitHub 密码）

### Q2: 构建失败显示红色 ❌？

**答**：
1. 点击失败的任务
2. 查看失败的步骤
3. 阅读错误信息
4. 或截图发给我帮你分析

### Q3: 找不到 Artifacts？

**答**：
1. 确保构建成功（✅ 绿色对勾）
2. 滚动到构建详情页面的最底部
3. 应该能看到 "Artifacts" 部分

### Q4: APK 能用多久？

**答**：
- Artifacts 在 GitHub 保存 90 天
- 下载到本地后永久有效
- 建议下载后保存到电脑

### Q5: 能否下载之前的构建？

**答**：
- 可以！在 Actions 标签查看所有历史构建
- 点击任意构建任务下载对应的 APK

---

## 📊 完整命令总结

```bash
# 1. 进入项目目录
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 2. 初始化 Git
git init

# 3. 添加所有文件
git add .

# 4. 提交
git commit -m "Initial commit"

# 5. 连接远程仓库（替换你的用户名）
git remote add origin https://github.com/你的用户名/EnReading.git

# 6. 设置分支名
git branch -M main

# 7. 推送
git push -u origin main
```

**然后访问**：https://github.com/你的用户名/EnReading/actions

---

## ✅ 检查清单

上传前确认：
- [ ] 已注册 GitHub 账号
- [ ] 已创建 EnReading 仓库（Public）
- [ ] 终端在正确的项目目录
- [ ] 已运行所有 git 命令
- [ ] 推送成功

构建后确认：
- [ ] Actions 标签显示构建任务
- [ ] 构建状态为成功 ✅
- [ ] 已下载 Artifacts
- [ ] 已解压得到 APK
- [ ] 已传输到手机
- [ ] 已成功安装

---

## 🎉 完成！

按照以上步骤，你应该已经：
1. ✅ 上传项目到 GitHub
2. ✅ 自动构建 APK
3. ✅ 下载并安装到手机
4. ✅ 开始使用应用！

如有任何问题，随时告诉我！😊

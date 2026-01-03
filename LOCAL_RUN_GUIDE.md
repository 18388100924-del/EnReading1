# 本地运行指南

## 📋 目标

在本地电脑运行 EnReading 应用，无需等待 GitHub Actions 构建。

---

## 🛠️ 方法一：安装 Flutter 完整环境（推荐）

### 步骤 1：安装 Homebrew（如果还没有）

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 步骤 2：安装 Flutter

```bash
# 使用 Homebrew 安装（最简单）
brew install --cask flutter

# 或者手动安装
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable
```

### 步骤 3：添加到 PATH（如果手动安装）

编辑 `~/.zshrc`：

```bash
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc
source ~/.zshrc
```

### 步骤 4：验证安装

```bash
flutter --version
flutter doctor
```

### 步骤 5：安装依赖

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading
flutter pub get
```

### 步骤 6：运行应用

**选项 A：在浏览器中运行（最快）**
```bash
flutter run -d chrome
```

**选项 B：在 iOS 模拟器运行（需要 Xcode）**
```bash
# 安装 Xcode（从 App Store）
# 打开 Xcode 至少一次
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

# 启动模拟器
open -a Simulator

# 运行应用
flutter run
```

**选项 C：构建 APK（连接安卓手机或模拟器）**
```bash
flutter build apk --release
# APK 在: build/app/outputs/flutter-apk/app-release.apk
```

---

## ⚡ 方法二：使用 FVM（Flutter 版本管理，推荐高级用户）

```bash
# 安装 FVM
brew tap leoafarias/fvm
brew install fvm

# 安装 Flutter
fvm install stable
fvm use stable

# 运行
fvm flutter pub get
fvm flutter run -d chrome
```

---

## 🌐 方法三：仅在浏览器运行（最简单，但功能受限）

### 前提：
- 只需要安装 Flutter
- 不需要 Android Studio
- 不需要 Xcode

### 步骤：

```bash
# 1. 安装 Flutter
brew install --cask flutter

# 2. 进入项目
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 3. 安装依赖
flutter pub get

# 4. 在浏览器运行
flutter run -d chrome
```

**注意**：浏览器版本不支持某些功能（如文件访问），但可以测试 UI。

---

## 📱 方法四：使用 Android 模拟器

### 步骤 1：安装 Android Studio

1. 下载：https://developer.android.com/studio
2. 安装并打开
3. 选择 "Standard" 安装
4. 等待 SDK 下载完成

### 步骤 2：创建虚拟设备

1. 打开 Android Studio
2. 点击 "More Actions" → "Virtual Device Manager"
3. 点击 "Create Device"
4. 选择 "Phone" → "Pixel 6"
5. 下载系统镜像（推荐：API 33 - Android 13）
6. 点击 "Finish"

### 步骤 3：启动模拟器

在 Android Studio 的 AVD Manager 中点击 "▶" 启动模拟器

### 步骤 4：运行应用

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading
flutter pub get
flutter run
```

Flutter 会自动检测到模拟器并安装应用。

---

## 🔧 方法五：使用真实安卓设备（USB 调试）

### 步骤 1：启用开发者选项

在安卓手机上：
1. 设置 → 关于手机
2. 连续点击"版本号" 7 次
3. 返回设置，进入"开发者选项"
4. 开启"USB 调试"

### 步骤 2：连接手机

1. 用 USB 线连接手机到电脑
2. 手机上允许 USB 调试
3. 选择"文件传输"模式

### 步骤 3：验证连接

```bash
flutter devices
```

应该显示你的设备。

### 步骤 4：运行

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading
flutter pub get
flutter run
```

应用会直接安装到手机上！

---

## 🎯 快速开始（推荐流程）

### 最简单的方式（5分钟）：

```bash
# 1. 安装 Flutter
brew install --cask flutter

# 2. 进入项目
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 3. 安装依赖
flutter pub get

# 4. 在浏览器运行
flutter run -d chrome
```

浏览器会自动打开并显示应用！

---

## 📊 不同方法对比

| 方法 | 时间 | 优点 | 缺点 |
|------|------|------|------|
| 浏览器 | 5分钟 | 最快，无需模拟器 | 功能受限 |
| iOS 模拟器 | 30分钟 | 接近真实体验 | 需要 Xcode（大） |
| Android 模拟器 | 45分钟 | 完整功能 | 需要下载大量文件 |
| 真实设备 | 10分钟 | 最真实 | 需要手机 |
| GitHub Actions | 10分钟 | 无需本地环境 | 需要等待 |

---

## ⚠️ 常见问题

### Q1: `flutter: command not found`

**解决**：
```bash
# 检查是否安装
which flutter

# 如果没有，使用 Homebrew 安装
brew install --cask flutter

# 或添加到 PATH
export PATH="$PATH:$HOME/development/flutter/bin"
```

### Q2: `flutter doctor` 显示很多错误

**解决**：
- Android 相关错误：忽略（如果只在浏览器或 iOS 运行）
- Xcode 错误：安装 Xcode（如果要在 iOS 运行）
- Chrome 错误：安装 Chrome 浏览器

### Q3: 依赖安装失败

**解决**：
```bash
flutter clean
flutter pub get
```

### Q4: 浏览器版本看不到文档

**原因**：浏览器不支持本地文件访问

**解决**：使用模拟器或真实设备

---

## 🔍 检查系统要求

### 最低要求：
- macOS 10.14 或更高
- 磁盘空间：
  - Flutter: 2.8 GB
  - Android Studio: 3-5 GB
  - Xcode: 12+ GB
- RAM: 8GB 推荐

### 检查命令：

```bash
# 检查 macOS 版本
sw_vers

# 检查可用空间
df -h

# 检查 RAM
sysctl hw.memsize
```

---

## 🚀 开始运行

### 选择你的方式：

**最快（5分钟）**：
```bash
brew install --cask flutter
cd /Users/henry/Documents/2026/CodeBuddy/EnReading
flutter pub get
flutter run -d chrome
```

**完整体验（需要 Android Studio）**：
1. 安装 Android Studio
2. 创建虚拟设备
3. 运行 `flutter run`

**最方便（如果有安卓手机）**：
1. 启用 USB 调试
2. 连接手机
3. 运行 `flutter run`

---

## 📚 相关资源

- Flutter 官方文档：https://docs.flutter.dev
- 安装指南：https://docs.flutter.dev/get-started/install/macos
- Flutter 中文网：https://flutter.cn

---

## 💡 建议

### 如果你是：

**只想测试应用** → 使用浏览器版本（最快）

**想开发调试** → 安装完整环境（Android Studio + Flutter）

**只想要 APK** → 继续使用 GitHub Actions（无需本地环境）

**需要频繁修改** → 安装 Flutter，连接真实设备（最方便）

---

需要帮助随时告诉我！😊

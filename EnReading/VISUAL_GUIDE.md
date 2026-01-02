# 📸 Codemagic 可视化构建指南

## 🎯 逐步图文说明

### 第 1 步：登录 Codemagic

```
┌────────────────────────────────────┐
│   Codemagic                        │
│                                    │
│   [Sign up for free]              │
│   [Sign in with GitHub]  ← 点这个  │
│   [Sign in with GitLab]           │
│   [Sign in with Bitbucket]        │
└────────────────────────────────────┘
```

**操作**: 点击 "Sign in with GitHub"

---

### 第 2 步：添加应用

```
┌────────────────────────────────────┐
│   Applications                     │
│                                    │
│   [+ Add application]  ← 点这个    │
│                                    │
└────────────────────────────────────┘
```

**操作**: 点击 "+ Add application"

---

### 第 3 步：选择仓库来源

```
┌────────────────────────────────────┐
│   Add application                  │
│                                    │
│   ○ Connect from repository        │
│      • GitHub                      │
│      • GitLab                      │
│      • Bitbucket                   │
│                                    │
│   ○ Upload from local  ← 或选这个  │
│                                    │
└────────────────────────────────────┘
```

**选择**:
- 如果项目在 GitHub: 选 "GitHub"
- 如果项目在本地: 选 "Upload from local"

---

### 第 4 步：项目类型识别

如果看到这个警告：

```
┌────────────────────────────────────┐
│   ⚠️ Warning                       │
│                                    │
│   The repository doesn't seem to   │
│   contain a mobile application.    │
│                                    │
│   [Specify project type manually]  │  ← 点这个！
│   [Adjust scan parameters]         │
│                                    │
└────────────────────────────────────┘
```

**操作**: 点击 "Specify project type manually"

---

### 第 5 步：选择项目类型

```
┌────────────────────────────────────┐
│   Select project type              │
│                                    │
│   ○ Native Android                 │
│   ○ Native iOS                     │
│   ● Flutter App          ← 选这个！│
│   ○ React Native                   │
│   ○ Ionic                          │
│   ○ Cordova                        │
│                                    │
│   [Continue]                       │
└────────────────────────────────────┘
```

**选择**: ● Flutter App
**操作**: 点击 "Continue"

---

### 第 6 步：配置构建设置

```
┌────────────────────────────────────┐
│   Build configuration              │
│                                    │
│   Platform *                       │
│   [Android ▼]          ← 选这个    │
│                                    │
│   Build mode *                     │
│   [Release ▼]          ← 选这个    │
│                                    │
│   Flutter version                  │
│   [stable ▼]           ← 保持这个  │
│                                    │
│   Build arguments (optional)       │
│   [_________________]  ← 留空      │
│                                    │
│   [Start new build]    ← 最后点这个│
└────────────────────────────────────┘
```

**填写**:
- Platform: `Android`
- Build mode: `Release`
- Flutter version: `stable`
- Build arguments: 留空

**操作**: 点击 "Start new build"

---

### 第 7 步：等待构建

```
┌────────────────────────────────────┐
│   Build #1                         │
│   Status: Running ⏳                │
│                                    │
│   ✓ Set up build machine          │
│   ✓ Clone repository              │
│   ✓ Install Flutter SDK           │
│   ⏳ Get Flutter packages          │
│   ⏸️ Build APK                     │
│   ⏸️ Upload artifacts              │
│                                    │
│   Estimated time: 8 minutes        │
└────────────────────────────────────┘
```

**操作**: 等待 5-10 分钟，可以看视频喝杯茶 ☕

---

### 第 8 步：构建完成

```
┌────────────────────────────────────┐
│   Build #1                         │
│   Status: Passed ✅                 │
│                                    │
│   ✓ Set up build machine          │
│   ✓ Clone repository              │
│   ✓ Install Flutter SDK           │
│   ✓ Get Flutter packages          │
│   ✓ Build APK                     │
│   ✓ Upload artifacts              │
│                                    │
│   Duration: 8m 23s                 │
│                                    │
│   📦 Artifacts                     │
│   ┌──────────────────────────────┐ │
│   │ app-release.apk   12.3 MB   │ │
│   │ [Download] [QR Code]  ← 点这里│ │
│   └──────────────────────────────┘ │
└────────────────────────────────────┘
```

**操作**: 
- 点击 "Download" 下载 APK 到电脑
- 或点击 "QR Code" 用手机扫码直接安装

---

## 📱 安装到手机

### 方法 1: USB 传输

```
电脑 ──USB线──> 手机
     
1. 连接手机到电脑
2. 手机上选择"文件传输"
3. 复制 app-release.apk 到手机
4. 在手机上找到 APK 并安装
```

### 方法 2: 云盘/微信

```
电脑 ──上传──> 云盘/微信 ──下载──> 手机

1. 上传 APK 到百度网盘/OneDrive/微信
2. 手机端下载
3. 点击安装
```

### 方法 3: 二维码（最快）

```
电脑上显示二维码
        ↓
    手机扫码
        ↓
   直接安装
```

在 Codemagic 点击 "QR Code"，用手机扫描即可！

---

## 🔧 如果构建失败

### 查看错误日志

```
┌────────────────────────────────────┐
│   Build #1                         │
│   Status: Failed ❌                 │
│                                    │
│   ✓ Set up build machine          │
│   ✓ Clone repository              │
│   ✓ Install Flutter SDK           │
│   ❌ Get Flutter packages  ← 点这个查看详情│
│                                    │
│   Error: Package not found         │
│   at pubspec.yaml line 12          │
└────────────────────────────────────┘
```

**操作**: 点击失败的步骤，查看详细错误信息

---

## 📊 界面元素说明

### 左侧导航栏

```
┌─────────────────┐
│ Applications    │  ← 应用列表
│ Builds          │  ← 构建历史
│ Teams           │  ← 团队管理
│ Integrations    │  ← 集成设置
│ Billing         │  ← 计费信息
└─────────────────┘
```

### 构建状态图标

```
✓  - 成功完成
⏳ - 正在运行
⏸️  - 等待执行
❌ - 失败
⏭️  - 已跳过
```

---

## 💡 实用提示

### 提示 1: 保存配置

第一次构建成功后，配置会自动保存。下次只需点击 "Start build" 即可。

### 提示 2: 构建历史

在 "Builds" 页面可以看到所有历史构建，可以重新下载之前的 APK。

### 提示 3: 通知设置

可以设置构建完成时发送邮件通知：

```
Settings → Notifications → Email
输入邮箱地址 → Save
```

### 提示 4: 并发构建

免费版同时只能构建 1 个项目。如果有多个项目，需要排队等待。

---

## 🎯 常见界面问题

### Q1: 找不到 "Specify project type manually" 按钮？

**位置**: 
- 在项目扫描完成后的警告框中
- 或在 "Settings" → "Project type" 中

### Q2: 找不到下载按钮？

**位置**: 
- 构建完成页面的底部
- "Artifacts" 或 "Build artifacts" 部分

### Q3: 界面是英文的，能改成中文吗？

**答**: Codemagic 目前只支持英文界面，但参考本指南即可轻松操作。

---

## 📞 需要帮助？

### 在线帮助

Codemagic 界面右下角有聊天图标：
```
┌────────────────────────────────────┐
│                                    │
│                                    │
│                                    │
│                          💬  ← 点这个│
└────────────────────────────────────┘
```

### 视频教程

YouTube 搜索: "Codemagic Flutter tutorial"

### 文档

官方文档: https://docs.codemagic.io/

---

## ✅ 检查清单

完整操作流程检查：

- [ ] 打开 codemagic.io
- [ ] 用 GitHub 登录
- [ ] 点击 "Add application"
- [ ] 选择仓库或上传本地项目
- [ ] 点击 "Specify project type manually"
- [ ] 选择 "Flutter App"
- [ ] Platform = Android
- [ ] Build mode = Release
- [ ] 点击 "Start new build"
- [ ] 等待构建完成
- [ ] 下载 APK 或扫码安装

**全部完成！** 🎉

---

希望这个可视化指南能帮助你顺利完成构建！如有任何疑问，随时询问我。😊

# Codemagic 设置指南

## 问题：无法识别移动应用

如果 Codemagic 提示 "The repository doesn't seem to contain a mobile application"，按以下步骤操作：

---

## 方法一：手动设置项目类型（最简单）

### 步骤：

1. **在 Codemagic 界面**
   - 点击 "Set up build" 或 "Configure"

2. **手动选择项目类型**
   - 找到 "Project type" 或 "Specify project type manually"
   - 选择 **"Flutter App"**

3. **配置构建设置**
   - Platform: **Android**
   - Build mode: **Release**

4. **保存并构建**
   - 点击 "Start new build"
   - 等待构建完成

---

## 方法二：使用 codemagic.yaml（推荐）

项目中已包含 `codemagic.yaml` 配置文件。

### 步骤：

1. **确保项目包含必要文件**
   - ✅ `pubspec.yaml`
   - ✅ `codemagic.yaml`
   - ✅ `android/` 目录
   - ✅ `lib/` 目录

2. **推送到 GitHub**
   ```bash
   cd /Users/henry/Documents/2026/CodeBuddy/EnReading
   git add codemagic.yaml analysis_options.yaml
   git commit -m "Add Codemagic configuration"
   git push
   ```

3. **在 Codemagic 重新扫描**
   - 返回 Codemagic
   - 点击 "Rescan" 或 "Refresh"
   - 应该能识别 Flutter 项目了

4. **配置工作流**
   - 选择 `android-workflow`
   - 点击 "Start new build"

---

## 方法三：使用 Codemagic CLI（命令行）

如果上述方法都不行，使用 Codemagic 的命令行工具：

### 步骤：

1. **创建 ZIP 包**
   ```bash
   cd /Users/henry/Documents/2026/CodeBuddy
   zip -r EnReading.zip EnReading/ -x "*/.*" "*/.git/*"
   ```

2. **在 Codemagic 上传**
   - 点击 "Add application"
   - 选择 "Upload project from local"
   - 上传 `EnReading.zip`

3. **选择项目类型**
   - 手动选择 "Flutter"
   - 选择 Android 平台

4. **开始构建**
   - 点击 "Start new build"

---

## 方法四：检查项目结构

确保项目结构完整：

```
EnReading/
├── pubspec.yaml          ← 必须存在
├── codemagic.yaml        ← 必须存在
├── lib/
│   └── main.dart         ← 必须存在
├── android/
│   ├── app/
│   │   └── build.gradle  ← 必须存在
│   ├── build.gradle      ← 必须存在
│   └── settings.gradle   ← 必须存在
└── assets/
    └── documents/
```

### 验证文件：

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 检查必要文件是否存在
ls -la pubspec.yaml
ls -la codemagic.yaml
ls -la lib/main.dart
ls -la android/app/build.gradle
```

---

## 常见问题解决

### Q1: 扫描后还是提示无法识别？

**解决方案**：
1. 在 Codemagic 界面点击 "Set up build manually"
2. 选择 "Flutter App"
3. 手动配置构建参数

### Q2: 构建失败，提示找不到 Flutter SDK？

**解决方案**：
在 `codemagic.yaml` 中已配置 `flutter: stable`，应该会自动安装。

如果还有问题，修改 `codemagic.yaml`：
```yaml
environment:
  flutter: 3.16.0  # 指定具体版本
```

### Q3: 构建卡在 "Get Flutter packages"？

**解决方案**：
检查 `pubspec.yaml` 中的依赖是否正确。

当前依赖：
- provider: ^6.1.1
- shared_preferences: ^2.2.2
- flutter_colorpicker: ^1.0.3
- csv: ^6.0.0
- pdf: ^3.10.7

这些都是稳定版本，应该没问题。

### Q4: 构建成功但找不到 APK？

**解决方案**：
APK 在 "Artifacts" 部分：
- 构建完成后，滚动到页面底部
- 找到 "Artifacts" 或"构建产物"
- 下载 `app-release.apk`

---

## 推荐构建配置

### 基础配置（已在 codemagic.yaml 中）：

```yaml
workflows:
  android-workflow:
    name: Android Workflow
    environment:
      flutter: stable
    scripts:
      - flutter packages pub get
      - flutter build apk --release
    artifacts:
      - build/app/outputs/flutter-apk/app-release.apk
```

### 高级配置（可选）：

如果需要更多控制，可以修改 `codemagic.yaml`：

```yaml
workflows:
  android-workflow:
    name: Android Release
    max_build_duration: 60
    environment:
      flutter: 3.16.0
      java: 17
    scripts:
      - name: Get dependencies
        script: flutter pub get
      - name: Analyze code
        script: flutter analyze
      - name: Build APK
        script: flutter build apk --release --split-per-abi
    artifacts:
      - build/app/outputs/flutter-apk/*.apk
```

---

## 替代方案：GitHub Actions

如果 Codemagic 还是有问题，使用 GitHub Actions（已配置）：

1. **确保项目在 GitHub**
2. **推送代码**触发自动构建
3. **在 Actions 标签下载 APK**

GitHub Actions 配置文件：`.github/workflows/build.yml`（已存在）

---

## 快速诊断命令

在本地运行这些命令，确保项目可以构建：

```bash
cd /Users/henry/Documents/2026/CodeBuddy/EnReading

# 如果有 Flutter，测试构建
flutter doctor
flutter pub get
flutter analyze
flutter build apk --release
```

如果本地构建成功，说明项目没问题，只是 Codemagic 配置问题。

---

## 获取帮助

如果以上方法都不行：

1. **Codemagic 支持**：在 Codemagic 界面点击右下角聊天图标
2. **GitHub Actions**：使用已配置的 GitHub Actions
3. **本地构建**：找有 Flutter 环境的朋友帮忙构建

---

## 最快解决方案

**现在立即尝试**：

1. 在 Codemagic 界面找到 **"Specify project type manually"** 按钮
2. 点击它
3. 选择 **"Flutter"**
4. 选择 **"Android"** 平台
5. 点击 **"Start build"**

这样应该能直接开始构建！✅

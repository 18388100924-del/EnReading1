# Codemagic 构建选项详细说明

## 📋 构建配置选项一览

### 第一步：Project type（项目类型）

**选项**: `Flutter App` ✅

**说明**: 
- 这是 Flutter 应用，必须选择 Flutter App
- 其他选项（如 React Native、Native Android）不要选

---

### 第二步：Platform（目标平台）

**选项**: `Android` ✅

**说明**: 
- 因为你只需要安卓 APK
- 不要选 iOS（需要 Mac 和 Apple 开发者账号）
- 不要选 Web 或 Desktop

---

### 第三步：Build mode（构建模式）

**选项**: `Release` ✅

**说明**: 
- Release: 正式发布版本，体积小，性能好，用于安装到手机
- Debug: 调试版本，体积大，仅用于开发测试
- Profile: 性能分析版本，用于性能测试

**选择 Release！** 这样生成的 APK 可以直接安装使用。

---

### 第四步：Flutter version（Flutter 版本）

**选项**: `stable` 或 `3.16.0` ✅

**可选项**:
- `stable` - 最新稳定版（推荐）✅
- `3.16.0` - 具体版本号
- `3.19.0` - 更新的版本
- `beta` - 测试版（不推荐）
- `master` - 开发版（不推荐）

**推荐选择**: `stable`（最稳定可靠）

---

### 第五步：Build arguments（构建参数）

**可选填写**: `--release` 或留空

**说明**: 
- 如果已选择 Release 模式，这里可以留空
- 高级选项（一般不需要）：
  - `--split-per-abi` - 为不同 CPU 架构生成独立 APK（减小单个 APK 体积）
  - `--obfuscate` - 代码混淆（保护代码）
  - `--no-shrink` - 不压缩（调试用）

**推荐**: 留空或填写 `--release`

---

### 第六步：Environment variables（环境变量）

**可选填写**: 一般留空 ✅

**说明**: 
- 用于设置 API keys、密钥等
- 本项目不需要，可以留空

示例（如果需要）：
```
API_KEY=your_api_key_here
BASE_URL=https://api.example.com
```

**推荐**: 留空

---

### 第七步：Build triggers（触发条件）

**选项**: 根据需求选择

**可选项**:
- ✅ `Manual` - 手动触发（点击按钮才构建）
- ✅ `Push to branch` - 推送代码时自动构建
- ❌ `Pull request` - 创建 PR 时构建（不需要）
- ❌ `Tag` - 创建标签时构建（不需要）

**推荐**: 
- 首次构建选择 `Manual`
- 熟悉后可以启用 `Push to branch`

---

### 第八步：Branch（分支）

**填写**: `main` 或 `master` ✅

**说明**: 
- 如果你的 GitHub 默认分支是 main，填 `main`
- 如果是 master，填 `master`
- 查看方法：在 GitHub 仓库页面，分支下拉框显示的就是默认分支

**推荐**: `main`（GitHub 新仓库默认分支名）

---

### 第九步：Build numbering（构建编号）

**选项**: 保持默认 ✅

**说明**: 
- Codemagic 会自动生成构建编号
- 不需要修改

---

### 第十步：Artifact name（产物名称）

**填写**: `app-release` 或留空 ✅

**说明**: 
- 生成的 APK 文件名
- 留空会使用默认名称
- 自定义名称方便识别（如：`EnReading-v1.0`）

**推荐**: 留空或填写 `EnReading`

---

## 🎯 完整配置示例

### 快速配置（推荐）

```
Project type:       Flutter App
Platform:           Android
Build mode:         Release
Flutter version:    stable
Build arguments:    (留空)
Environment vars:   (留空)
Build triggers:     Manual
Branch:             main
Artifact name:      (留空)
```

### 高级配置（可选）

```
Project type:       Flutter App
Platform:           Android
Build mode:         Release
Flutter version:    3.16.0
Build arguments:    --split-per-abi
Environment vars:   (留空)
Build triggers:     Push to branch
Branch:             main
Artifact name:      EnReading
```

---

## 📱 其他可能出现的选项

### Java version（Java 版本）

**选项**: `17` 或 `11` ✅

**说明**: 
- 如果出现此选项，选择 `17`（推荐）
- 或选择 `11`（也兼容）

---

### Xcode version（仅 iOS）

**说明**: 
- 构建 Android 不需要
- 如果出现，忽略即可

---

### CocoaPods version（仅 iOS）

**说明**: 
- 构建 Android 不需要
- 如果出现，忽略即可

---

### Gradle version（Gradle 版本）

**选项**: 保持默认 ✅

**说明**: 
- Flutter 会自动处理
- 不需要手动指定

---

## ⚙️ YAML 配置（如果使用配置文件）

如果 Codemagic 要求使用 YAML 配置，项目中已包含 `codemagic.yaml`：

```yaml
workflows:
  android-workflow:
    name: Android Workflow
    max_build_duration: 60
    environment:
      flutter: stable          # Flutter 版本
      xcode: latest           # 忽略（仅 iOS 需要）
      cocoapods: default      # 忽略（仅 iOS 需要）
    scripts:
      - name: Get Flutter packages
        script: |
          flutter packages pub get
      - name: Build APK
        script: |
          flutter build apk --release
    artifacts:
      - build/app/outputs/flutter-apk/app-release.apk
    publishing:
      email:
        recipients:
          - your-email@example.com  # 改成你的邮箱
```

**修改项**：
- `your-email@example.com` 改成你的邮箱地址
- 其他保持不变

---

## 🚀 构建流程

### 1. 点击 "Start new build"

### 2. 等待构建（5-10分钟）

构建过程显示：
```
✓ Set up build machine
✓ Clone repository
✓ Install Flutter SDK
✓ Get Flutter packages
✓ Build APK
✓ Upload artifacts
```

### 3. 查看日志

如果构建失败，点击失败的步骤查看详细日志。

### 4. 下载 APK

构建成功后：
- 滚动到 "Artifacts" 或 "Build artifacts" 部分
- 点击 APK 文件名下载
- 或扫描二维码直接安装到手机

---

## ❌ 常见错误和解决方案

### 错误 1: "Flutter SDK not found"

**解决**: 
- Flutter version 选择 `stable`
- 或重新构建

### 错误 2: "Gradle build failed"

**解决**: 
- 检查 `android/app/build.gradle` 文件是否完整
- 项目中已包含正确配置，应该不会出现此错误

### 错误 3: "Package not found"

**解决**: 
- 检查 `pubspec.yaml` 中的依赖
- 确保所有包都是公开可用的

### 错误 4: "Build timeout"

**解决**: 
- 增加 `max_build_duration` 到 60 或 120
- 在 YAML 配置中已设置为 60 分钟

---

## 💡 最佳实践

### 首次构建

1. ✅ 使用所有默认选项
2. ✅ 只修改必须的选项（Project type、Platform、Build mode）
3. ✅ 先成功构建一次，再调整高级选项

### 后续构建

1. 启用自动触发（Push to branch）
2. 使用 `--split-per-abi` 减小 APK 体积
3. 配置邮件通知

---

## 🎯 快速检查清单

在点击 "Start build" 之前，确认：

- [ ] Project type = Flutter App
- [ ] Platform = Android
- [ ] Build mode = Release
- [ ] Flutter version = stable
- [ ] Branch = main（或你的默认分支）
- [ ] 其他选项保持默认或留空

**全部确认后，点击 "Start new build"！** ✅

---

## 📞 需要帮助？

如果遇到其他选项或不确定如何填写：
1. 截图发给我
2. 或保持默认值
3. 或查看 Codemagic 文档：[docs.codemagic.io](https://docs.codemagic.io/flutter/flutter-projects/)

祝你构建成功！🎉

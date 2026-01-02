# 🚀 快速上手指南

## 最快获取 APK 的方法

### 方案 A：Codemagic（5分钟，最简单）

⚠️ **注意**：如果遇到 "Shorebird token is required" 错误，请查看 [`SHOREBIRD_ISSUE.md`](SHOREBIRD_ISSUE.md) 或直接使用方案 B。

1. 访问 [codemagic.io](https://codemagic.io)
2. 点击 "Sign up for free"，用 GitHub 登录
3. 点击 "Add application"
4. 如果项目在 GitHub：
   - 选择你的仓库
   - 如果提示"无法识别移动应用"，点击 **"Specify project type manually"**
   - 选择 **"Flutter App"**
   - **重要**：确保 **"Shorebird"** 选项未勾选
5. 如果项目在本地：
   - 选择 "Upload from local"
   - 上传整个项目文件夹的 ZIP
6. 配置构建：
   - Project type: **Flutter App**
   - Platform: **Android**
   - Build mode: **Release**
   - Integrations: **不要勾选 Shorebird**
7. 点击 "Start new build"
8. 等待 5-10 分钟
9. 构建完成后：
   - 点击下载 APK
   - 或扫描二维码直接安装

**遇到问题？** 查看 [`SHOREBIRD_ISSUE.md`](SHOREBIRD_ISSUE.md) 或使用下面的 GitHub Actions 方案

---

### 方案 B：GitHub Actions（10分钟，推荐）

**优点**：配置完整，不会有依赖问题，完全自动化 ✨

#### 前提：需要 GitHub 账号

1. **上传项目到 GitHub**

   打开终端，执行：
   ```bash
   cd /Users/henry/Documents/2026/CodeBuddy/EnReading
   
   # 初始化 Git
   git init
   
   # 添加所有文件
   git add .
   
   # 提交
   git commit -m "Initial commit"
   ```

2. **在 GitHub 创建仓库**
   - 访问 [github.com/new](https://github.com/new)
   - 仓库名：`EnReading`
   - 设置为 Public
   - 不要添加 README、.gitignore 或 license
   - 点击 "Create repository"

3. **推送代码**
   
   复制 GitHub 显示的命令，或执行：
   ```bash
   git remote add origin https://github.com/你的用户名/EnReading.git
   git branch -M main
   git push -u origin main
   ```

4. **等待自动构建**
   - 推送后，GitHub Actions 自动开始构建
   - 在仓库页面点击 "Actions" 标签查看进度
   - 等待约 5-10 分钟

5. **下载 APK**
   - 构建完成后，点击构建任务名称
   - 滚动到底部 "Artifacts" 部分
   - 点击 `app-release` 下载
   - 解压 ZIP，里面就是 APK 文件

---

### 方案 C：请人帮忙（最快，但需要找人）

1. **打包项目**
   ```bash
   cd /Users/henry/Documents/2026/CodeBuddy/EnReading
   cd ..
   zip -r EnReading.zip EnReading/
   ```

2. **发送给懂 Flutter 的朋友**
   - 通过微信、QQ、邮件等发送 `EnReading.zip`

3. **朋友执行以下命令**
   ```bash
   unzip EnReading.zip
   cd EnReading
   flutter pub get
   flutter build apk --release
   ```

4. **获取 APK**
   - 让朋友把 `build/app/outputs/flutter-apk/app-release.apk` 发回给你

---

## 📱 安装到手机

### Android 手机安装步骤：

1. **传输 APK 到手机**
   - 通过 USB 数据线
   - 或上传到云盘后手机下载
   - 或通过微信/QQ 发送

2. **允许安装未知来源应用**
   - 打开手机设置
   - 搜索"未知来源"或"安装未知应用"
   - 允许文件管理器或浏览器安装应用

3. **安装 APK**
   - 在手机上找到 APK 文件
   - 点击安装
   - 等待安装完成

4. **打开应用**
   - 点击桌面上的 "EnReading" 图标
   - 开始使用！

---

## 📝 添加自己的学习文档

### 最简单方法：编辑 CSV 文件

1. **用 Excel 或 WPS 打开**
   - 文件位置：`assets/documents/sample_reading.csv`

2. **编辑内容**
   
   示例格式：
   ```
   TITLE,我的英语学习
   DESCRIPTION,日常学习材料
   ENGLISH,CHINESE,HIGHLIGHT_WORDS
   Hello world,你好世界,
   This is a test,这是一个测试,test|A trial|测试|10|14
   ```

3. **保存文件**
   - 另存为 CSV UTF-8 格式
   - 放回 `assets/documents/` 目录

4. **重新构建 APK**
   - 使用上述任一方法重新生成 APK
   - 安装新的 APK 到手机

---

## 🎓 高亮词位置计算

### 简单方法：

使用在线工具或这个公式：

```
句子: "This is a test"
位置:  0123456789...

单词 "test" 的位置：
- 开始位置：10 (t 的位置)
- 结束位置：14 (t 后面的位置)
```

### Python 计算器：

```python
sentence = "This is a test"
word = "test"
start = sentence.find(word)
end = start + len(word)
print(f"{word}: {start}-{end}")
```

### Excel 公式：

```excel
# 假设句子在 A1，单词在 B1
# 开始位置：
=FIND(B1,A1)-1

# 结束位置：
=FIND(B1,A1)+LEN(B1)-1
```

---

## ⚠️ 常见问题

### Q: 手机提示"安装已被阻止"？
A: 进入设置 → 安全 → 允许安装未知应用

### Q: 应用闪退？
A: 确保 Android 版本 ≥ 5.0 (API 21)

### Q: 看不到文档？
A: 检查 CSV 文件格式是否正确，确保是 UTF-8 编码

### Q: 高亮词点击没反应？
A: 检查单词位置索引是否正确

---

## 📞 获取帮助

如果遇到问题：

1. 查看 `BUILD_INSTRUCTIONS.md` 详细说明
2. 查看 `DOCUMENT_FORMATS.md` 了解文档格式
3. 检查 GitHub Actions 构建日志
4. 在 GitHub Issues 提问

---

## 🎉 开始使用

**推荐流程**：
1. 使用 Codemagic 构建第一个 APK（5分钟）
2. 安装到手机测试
3. 用 Excel 编辑 CSV 文档
4. 重新构建并安装更新

祝你学习愉快！📚

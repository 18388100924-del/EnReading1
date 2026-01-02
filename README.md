# English Reading App 📚

一个支持安卓手机的英语阅读应用，帮助你学习英语句子、翻译和词汇。

## ✨ 功能特性

- 📖 **文档阅读** - 逐句阅读英文文档
- 🔤 **点击翻译** - 点击句子显示中文翻译
- 💡 **单词释义** - 点击高亮单词查看释义（英英/中文可切换）
- 🎨 **个性化设置** - 调节背景颜色和字体大小
- 📝 **多格式支持** - JSON、CSV、PDF 三种文档格式

## 🚀 快速开始

### 获取 APK 文件

**方法一：Codemagic（最简单，5分钟）**
1. 访问 [codemagic.io](https://codemagic.io)
2. 用 GitHub 登录，上传项目
3. 点击构建，等待完成
4. 下载 APK 或扫码安装

**方法二：GitHub Actions（10分钟）**
1. 上传项目到 GitHub
2. 自动触发构建
3. 在 Actions 页面下载 APK

**详细步骤请查看**: [`QUICK_START.md`](QUICK_START.md) 或 [`BUILD_INSTRUCTIONS.md`](BUILD_INSTRUCTIONS.md)

### 安装到手机

1. 将 APK 文件传输到手机
2. 允许安装未知来源应用
3. 点击安装
4. 开始使用！

## 📝 添加学习文档

### 使用 CSV 格式（推荐）

用 Excel 或 Google Sheets 创建：

```csv
TITLE,我的英语学习
DESCRIPTION,学习材料描述
ENGLISH,CHINESE,HIGHLIGHT_WORDS
The quick brown fox.,敏捷的棕色狐狸。,quick|Fast|快速的|4|9
I love learning.,我喜欢学习。,learning|Study|学习|7|15
```

保存为 CSV UTF-8，放入 `assets/documents/` 目录，重新构建应用。

**详细格式说明**: [`DOCUMENT_FORMATS.md`](DOCUMENT_FORMATS.md)

## 📂 项目结构

```
EnReading/
├── lib/                    # 应用源码
│   ├── models/            # 数据模型
│   ├── screens/           # 页面
│   ├── services/          # 服务（文档加载、解析）
│   ├── providers/         # 状态管理
│   └── widgets/           # UI 组件
├── assets/
│   └── documents/         # 文档存放目录
│       ├── *.json         # JSON 格式文档
│       ├── *.csv          # CSV 格式文档
│       └── *.pdf          # PDF 格式文档
└── android/               # Android 配置
```

## 🛠️ 技术栈

- **框架**: Flutter 3.0+
- **语言**: Dart
- **状态管理**: Provider
- **本地存储**: SharedPreferences
- **文档格式**: JSON, CSV, PDF

## 📖 文档

- 🚀 [`QUICK_START.md`](QUICK_START.md) - 快速上手指南（必读）
- 🔨 [`BUILD_INSTRUCTIONS.md`](BUILD_INSTRUCTIONS.md) - 详细构建说明
- 📸 [`VISUAL_GUIDE.md`](VISUAL_GUIDE.md) - 可视化构建指南
- ⚙️ [`CODEMAGIC_BUILD_OPTIONS.md`](CODEMAGIC_BUILD_OPTIONS.md) - 构建选项详解
- 🔧 [`CODEMAGIC_SETUP.md`](CODEMAGIC_SETUP.md) - Codemagic 问题排查
- ⚠️ [`SHOREBIRD_ISSUE.md`](SHOREBIRD_ISSUE.md) - Shorebird 错误解决
- 📝 [`DOCUMENT_FORMATS.md`](DOCUMENT_FORMATS.md) - 文档格式详解

## 💡 使用建议

1. **首次使用**: 先用示例文档测试应用
2. **创建文档**: 使用 CSV 格式最简单
3. **计算索引**: 用 Python 或 Excel 辅助计算单词位置
4. **批量制作**: 在 Excel 中批量编辑多个句子

## 📱 系统要求

- Android 5.0 (API 21) 或更高版本
- 约 20MB 存储空间

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

---

**开始你的英语学习之旅！** 🎓

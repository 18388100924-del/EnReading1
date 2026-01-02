# 文档格式说明

应用现在支持三种文档格式：**JSON**、**CSV** 和 **PDF**。

## 📄 CSV 格式（推荐）

CSV格式最简单易用，适合用Excel或Google Sheets编辑。

### CSV 文件结构

```csv
TITLE,Your Document Title
DESCRIPTION,Your document description here
ENGLISH,CHINESE,HIGHLIGHT_WORDS
First English sentence.,第一句中文翻译。,word|English definition|中文释义|startIdx|endIdx
Second English sentence.,第二句中文翻译。,
```

### 重要规则

1. **前两行**: 必须是 `TITLE` 和 `DESCRIPTION`
2. **第三行**: 列标题（ENGLISH, CHINESE, HIGHLIGHT_WORDS）
3. **第四行开始**: 句子内容

### 高亮词格式

在 `HIGHLIGHT_WORDS` 列中，使用以下格式：

```
word|English definition|中文释义|起始位置|结束位置
```

**多个高亮词**用分号 `;` 分隔：

```
quick|Moving fast|快速的|4|9;lazy|Unwilling to work|懒惰的|35|39
```

### 索引位置计算

索引从0开始，计算英文句子中单词的字符位置：

```
The quick brown fox
012345678901234567
    ^    ^
    4    9
```

- `quick` 的 startIndex = 4（T=0, h=1, e=2, 空格=3, q=4）
- `quick` 的 endIndex = 9（k的下一个位置）

### CSV 示例

```csv
TITLE,Daily English Practice
DESCRIPTION,Common phrases for everyday use
ENGLISH,CHINESE,HIGHLIGHT_WORDS
The quick brown fox jumps.,敏捷的棕色狐狸跳跃。,quick|Fast|快速的|4|9
I love learning English.,我喜欢学习英语。,learning|Acquiring knowledge|学习|7|15
```

### 使用 Excel 创建 CSV

1. 打开 Excel 或 Google Sheets
2. 按照上述格式填写内容
3. 另存为 `.csv` 格式（CSV UTF-8）
4. 放入 `assets/documents/` 目录

---

## 📋 JSON 格式

JSON格式提供最大的灵活性和精确控制。

### JSON 文件结构

```json
{
  "id": "document_id",
  "title": "Document Title",
  "description": "Document description",
  "sentences": [
    {
      "english": "English sentence here.",
      "chinese": "中文翻译在这里。",
      "highlightWords": [
        {
          "word": "sentence",
          "englishDefinition": "A set of words expressing a complete thought.",
          "chineseDefinition": "句子",
          "startIndex": 8,
          "endIndex": 16
        }
      ]
    }
  ]
}
```

### JSON 完整示例

```json
{
  "id": "daily_conversation",
  "title": "Daily Conversation",
  "description": "Common daily expressions",
  "sentences": [
    {
      "english": "The weather is beautiful today.",
      "chinese": "今天天气很好。",
      "highlightWords": [
        {
          "word": "beautiful",
          "englishDefinition": "Pleasing to the senses or mind.",
          "chineseDefinition": "美丽的；美好的",
          "startIndex": 15,
          "endIndex": 24
        }
      ]
    },
    {
      "english": "Practice makes perfect.",
      "chinese": "熟能生巧。",
      "highlightWords": [
        {
          "word": "practice",
          "englishDefinition": "Repeated exercise to improve skill.",
          "chineseDefinition": "练习；实践",
          "startIndex": 0,
          "endIndex": 8
        },
        {
          "word": "perfect",
          "englishDefinition": "Without flaws; excellent.",
          "chineseDefinition": "完美的",
          "startIndex": 15,
          "endIndex": 22
        }
      ]
    }
  ]
}
```

---

## 📕 PDF 格式

PDF格式需要配合JSON数据文件使用。

### PDF 使用方法

1. 创建你的PDF文档（包含英文内容）
2. 创建同名的 `_data.json` 文件

**示例**：
- PDF文件: `reading_material.pdf`
- 数据文件: `reading_material_data.json`

`reading_material_data.json` 使用标准JSON格式：

```json
{
  "id": "reading_material",
  "title": "Reading Material",
  "description": "PDF document content",
  "sentences": [
    {
      "english": "Content from PDF...",
      "chinese": "PDF中的内容...",
      "highlightWords": []
    }
  ]
}
```

### 为什么需要数据文件？

PDF是一种显示格式，从PDF中提取结构化文本（带翻译和词汇标注）非常困难。使用配套的JSON数据文件可以：
- 精确控制翻译和词汇
- 保持应用性能
- 便于维护和更新

---

## 🎯 格式选择建议

| 格式 | 优点 | 缺点 | 适用场景 |
|------|------|------|----------|
| **CSV** | ✅ 最简单<br>✅ Excel编辑<br>✅ 易于批量制作 | ⚠️ 需要计算索引 | 📝 快速创建大量文档<br>📊 团队协作 |
| **JSON** | ✅ 精确控制<br>✅ 易于编程生成<br>✅ 格式清晰 | ⚠️ 手工编写繁琐 | 💻 程序化生成<br>🔧 需要精确控制 |
| **PDF** | ✅ 保留原始排版<br>✅ 专业外观 | ⚠️ 需要配套数据文件<br>⚠️ 制作复杂 | 📚 已有PDF教材<br>📖 需要原始排版 |

**推荐**: 大多数情况下使用 **CSV格式**，它简单、直观、易于编辑。

---

## 🔧 文件放置位置

所有文档文件都应放在：

```
assets/documents/
├── sample_document.json
├── sample_reading.csv
├── business_english.csv
├── reading_material.pdf
└── reading_material_data.json
```

---

## 📝 CSV 模板下载

创建文件 `template.csv`:

```csv
TITLE,Your Document Title Here
DESCRIPTION,Brief description of your document
ENGLISH,CHINESE,HIGHLIGHT_WORDS
First sentence in English.,第一句的中文翻译。,
Second sentence with highlights.,带有高亮的第二句。,highlights|Important words|高亮|19|29
Add more sentences here.,在这里添加更多句子。,
```

---

## ❓ 常见问题

### Q: 如何快速计算单词索引？

**方法1**: 使用在线工具
- 将句子粘贴到文本编辑器
- 使用查找功能定位单词
- 记录位置

**方法2**: 使用Python脚本
```python
sentence = "The quick brown fox"
word = "quick"
start = sentence.index(word)
end = start + len(word)
print(f"{word}: {start}-{end}")  # quick: 4-9
```

### Q: CSV文件中的中文显示乱码？

确保保存为 **UTF-8 编码**：
- Excel: 另存为 → CSV UTF-8 (逗号分隔)
- Google Sheets: 文件 → 下载 → CSV

### Q: 可以混合使用多种格式吗？

可以！应用会自动识别和加载所有支持的格式。

---

## 🚀 快速开始

1. 复制 `sample_reading.csv` 作为模板
2. 用Excel打开并修改内容
3. 保存为UTF-8 CSV格式
4. 放入 `assets/documents/` 目录
5. 运行 `flutter pub get` 和 `flutter run`

祝你创建出优秀的英语学习材料！📚

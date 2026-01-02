import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import '../models/document.dart';

class CsvParser {
  /// Parse CSV document with the following format:
  /// 
  /// Row 1: TITLE, <document title>
  /// Row 2: DESCRIPTION, <document description>
  /// Row 3: (empty or header)
  /// Row 4+: English, Chinese, HighlightWords
  /// 
  /// HighlightWords format: word|englishDef|chineseDef|startIdx|endIdx; (semicolon separated for multiple words)
  /// Example: quick|Moving fast|快速的|4|9;lazy|Unwilling to work|懒惰的|35|39
  static Future<Document?> parseCsv(String assetPath) async {
    try {
      final String csvString = await rootBundle.loadString(assetPath);
      final List<List<dynamic>> rows = const CsvToListConverter().convert(csvString);
      
      if (rows.length < 4) {
        print('CSV file too short');
        return null;
      }
      
      // Extract title and description
      String title = '';
      String description = '';
      int sentenceStartRow = 3;
      
      // Parse header rows
      for (int i = 0; i < rows.length && i < 3; i++) {
        if (rows[i].isEmpty) continue;
        
        final firstCell = rows[i][0].toString().toUpperCase();
        if (firstCell == 'TITLE' && rows[i].length > 1) {
          title = rows[i][1].toString();
        } else if (firstCell == 'DESCRIPTION' && rows[i].length > 1) {
          description = rows[i][1].toString();
        } else if (firstCell == 'ENGLISH' || firstCell == 'EN') {
          // This is the header row
          sentenceStartRow = i + 1;
          break;
        }
      }
      
      // Generate document ID from filename
      final fileName = assetPath.split('/').last.replaceAll('.csv', '');
      final documentId = fileName.replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '_');
      
      if (title.isEmpty) {
        title = fileName.replaceAll('_', ' ');
      }
      
      // Parse sentences
      List<Sentence> sentences = [];
      for (int i = sentenceStartRow; i < rows.length; i++) {
        final row = rows[i];
        if (row.length < 2) continue;
        
        final english = row[0].toString().trim();
        final chinese = row[1].toString().trim();
        
        if (english.isEmpty) continue;
        
        List<HighlightWord> highlightWords = [];
        if (row.length > 2 && row[2].toString().isNotEmpty) {
          highlightWords = _parseHighlightWords(row[2].toString(), english);
        }
        
        sentences.add(Sentence(
          english: english,
          chinese: chinese,
          highlightWords: highlightWords,
        ));
      }
      
      if (sentences.isEmpty) {
        print('No sentences found in CSV');
        return null;
      }
      
      return Document(
        id: documentId,
        title: title,
        description: description,
        sentences: sentences,
      );
    } catch (e) {
      print('Error parsing CSV: $e');
      return null;
    }
  }
  
  /// Parse highlight words from CSV cell
  /// Format: word|englishDef|chineseDef|startIdx|endIdx;word2|...
  static List<HighlightWord> _parseHighlightWords(String highlightString, String englishText) {
    List<HighlightWord> words = [];
    
    if (highlightString.trim().isEmpty) return words;
    
    final wordEntries = highlightString.split(';');
    for (final entry in wordEntries) {
      final parts = entry.split('|');
      if (parts.length < 5) continue;
      
      try {
        final word = parts[0].trim();
        final englishDef = parts[1].trim();
        final chineseDef = parts[2].trim();
        final startIdx = int.parse(parts[3].trim());
        final endIdx = int.parse(parts[4].trim());
        
        // Validate indices
        if (startIdx >= 0 && endIdx <= englishText.length && startIdx < endIdx) {
          words.add(HighlightWord(
            word: word,
            englishDefinition: englishDef,
            chineseDefinition: chineseDef,
            startIndex: startIdx,
            endIndex: endIdx,
          ));
        }
      } catch (e) {
        print('Error parsing highlight word entry: $entry - $e');
      }
    }
    
    return words;
  }
  
  /// Generate a template CSV string
  static String generateTemplateCsv() {
    return '''TITLE,Sample Document Title
DESCRIPTION,A brief description of your document
ENGLISH,CHINESE,HIGHLIGHT_WORDS
The quick brown fox jumps over the lazy dog.,敏捷的棕色狐狸跳过懒狗。,quick|Moving fast|快速的|4|9;lazy|Unwilling to work|懒惰的|35|39
Reading is an important skill.,阅读是一项重要技能。,important|Of great significance|重要的|14|23
Practice makes perfect.,熟能生巧。,practice|Repeated exercise|练习|0|8
''';
  }
}

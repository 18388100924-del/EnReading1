import 'package:flutter/material.dart';
import '../models/document.dart';
import 'word_definition_dialog.dart';

class SentenceWidget extends StatelessWidget {
  final Sentence sentence;
  final bool isExpanded;
  final VoidCallback onTap;
  final double fontSize;
  final bool showChineseDefinition;

  const SentenceWidget({
    super.key,
    required this.sentence,
    required this.isExpanded,
    required this.onTap,
    required this.fontSize,
    required this.showChineseDefinition,
  });

  void _showWordDefinition(BuildContext context, HighlightWord word) {
    showDialog(
      context: context,
      builder: (context) => WordDefinitionDialog(
        word: word,
        showChineseDefinition: showChineseDefinition,
      ),
    );
  }

  List<TextSpan> _buildTextSpans(BuildContext context) {
    if (sentence.highlightWords.isEmpty) {
      return [
        TextSpan(
          text: sentence.english,
          style: TextStyle(fontSize: fontSize, color: Colors.black87),
        ),
      ];
    }

    List<TextSpan> spans = [];
    int currentIndex = 0;

    // Sort highlight words by start index
    final sortedWords = List<HighlightWord>.from(sentence.highlightWords)
      ..sort((a, b) => a.startIndex.compareTo(b.startIndex));

    for (final word in sortedWords) {
      // Add text before the highlight word
      if (currentIndex < word.startIndex) {
        spans.add(
          TextSpan(
            text: sentence.english.substring(currentIndex, word.startIndex),
            style: TextStyle(fontSize: fontSize, color: Colors.black87),
          ),
        );
      }

      // Add the highlight word
      spans.add(
        TextSpan(
          text: sentence.english.substring(word.startIndex, word.endIndex),
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _showWordDefinition(context, word),
        ),
      );

      currentIndex = word.endIndex;
    }

    // Add remaining text
    if (currentIndex < sentence.english.length) {
      spans.add(
        TextSpan(
          text: sentence.english.substring(currentIndex),
          style: TextStyle(fontSize: fontSize, color: Colors.black87),
        ),
      );
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: _buildTextSpans(context),
                ),
              ),
              if (isExpanded) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    sentence.chinese,
                    style: TextStyle(
                      fontSize: fontSize - 2,
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class TapGestureRecognizer extends TapGestureRecognizer {
  TapGestureRecognizer({this.onTap});

  final VoidCallback? onTap;

  @override
  void handleTapUp({PointerUpEvent? up}) {
    super.handleTapUp(up: up);
    onTap?.call();
  }
}

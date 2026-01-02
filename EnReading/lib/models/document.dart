class Document {
  final String id;
  final String title;
  final String description;
  final List<Sentence> sentences;

  Document({
    required this.id,
    required this.title,
    required this.description,
    required this.sentences,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      sentences: (json['sentences'] as List)
          .map((s) => Sentence.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Sentence {
  final String english;
  final String chinese;
  final List<HighlightWord> highlightWords;

  Sentence({
    required this.english,
    required this.chinese,
    required this.highlightWords,
  });

  factory Sentence.fromJson(Map<String, dynamic> json) {
    return Sentence(
      english: json['english'] as String,
      chinese: json['chinese'] as String,
      highlightWords: (json['highlightWords'] as List?)
              ?.map((w) => HighlightWord.fromJson(w as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class HighlightWord {
  final String word;
  final String englishDefinition;
  final String chineseDefinition;
  final int startIndex;
  final int endIndex;

  HighlightWord({
    required this.word,
    required this.englishDefinition,
    required this.chineseDefinition,
    required this.startIndex,
    required this.endIndex,
  });

  factory HighlightWord.fromJson(Map<String, dynamic> json) {
    return HighlightWord(
      word: json['word'] as String,
      englishDefinition: json['englishDefinition'] as String,
      chineseDefinition: json['chineseDefinition'] as String,
      startIndex: json['startIndex'] as int,
      endIndex: json['endIndex'] as int,
    );
  }
}

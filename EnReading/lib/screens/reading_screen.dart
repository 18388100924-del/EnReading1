import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/document.dart';
import '../providers/settings_provider.dart';
import '../widgets/sentence_widget.dart';
import 'settings_screen.dart';

class ReadingScreen extends StatefulWidget {
  final Document document;

  const ReadingScreen({super.key, required this.document});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final Set<int> _expandedSentences = {};

  void _toggleSentence(int index) {
    setState(() {
      if (_expandedSentences.contains(index)) {
        _expandedSentences.remove(index);
      } else {
        _expandedSentences.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, _) {
        return Scaffold(
          backgroundColor: settings.backgroundColor,
          appBar: AppBar(
            title: Text(widget.document.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: widget.document.sentences.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final sentence = widget.document.sentences[index];
              final isExpanded = _expandedSentences.contains(index);

              return SentenceWidget(
                sentence: sentence,
                isExpanded: isExpanded,
                onTap: () => _toggleSentence(index),
                fontSize: settings.fontSize,
                showChineseDefinition: settings.showChineseDefinition,
              );
            },
          ),
        );
      },
    );
  }
}

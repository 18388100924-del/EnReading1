import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showColorPicker(BuildContext context, SettingsProvider settings) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Background Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: settings.backgroundColor,
              onColorChanged: (Color color) {
                settings.setBackgroundColor(color);
              },
              availableColors: const [
                Colors.white,
                Colors.black,
                Color(0xFFFFF8DC), // Cornsilk
                Color(0xFFFAF0E6), // Linen
                Color(0xFFFFF5EE), // Seashell
                Color(0xFFF5F5DC), // Beige
                Color(0xFFE6E6FA), // Lavender
                Color(0xFFF0F8FF), // Alice Blue
                Color(0xFFFFFAF0), // Floral White
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, _) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Background Color',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () => _showColorPicker(context, settings),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: settings.backgroundColor,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text('Tap to change color'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Font Size',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text('${settings.fontSize.toInt()}'),
                          Expanded(
                            child: Slider(
                              value: settings.fontSize,
                              min: 12,
                              max: 28,
                              divisions: 16,
                              label: settings.fontSize.toInt().toString(),
                              onChanged: (value) {
                                settings.setFontSize(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Sample text with current font size',
                        style: TextStyle(fontSize: settings.fontSize),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quick Presets',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: [
                          _PresetButton(
                            label: 'Default',
                            color: Colors.white,
                            onTap: () => settings.setBackgroundColor(Colors.white),
                          ),
                          _PresetButton(
                            label: 'Night',
                            color: Colors.black,
                            onTap: () => settings.setBackgroundColor(Colors.black),
                          ),
                          _PresetButton(
                            label: 'Sepia',
                            color: const Color(0xFFFFF8DC),
                            onTap: () => settings.setBackgroundColor(const Color(0xFFF5F5DC)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PresetButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _PresetButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      ),
      child: Text(label),
    );
  }
}

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../models/document.dart';

class PdfParser {
  /// Parse PDF document that follows a specific format:
  /// - Title on first line
  /// - Description on second line  
  /// - Then alternating: English sentence, Chinese translation, highlight info
  /// 
  /// Highlight format: word|englishDef|chineseDef|startIdx|endIdx (comma separated)
  static Future<Document?> parsePdf(String assetPath) async {
    try {
      final ByteData data = await rootBundle.load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List();
      
      // For reading PDF text, we need a PDF reader library
      // Since pdf package is mainly for creating PDFs, we'll use a simpler approach:
      // Store PDF metadata in a companion JSON file, or use text extraction
      
      // Alternative: Extract filename and load corresponding data file
      final fileName = assetPath.split('/').last.replaceAll('.pdf', '');
      final dataPath = assetPath.replaceAll('.pdf', '_data.json');
      
      try {
        final String jsonContent = await rootBundle.loadString(dataPath);
        final Map<String, dynamic> jsonData = json.decode(jsonContent);
        return Document.fromJson(jsonData);
      } catch (e) {
        print('No companion data file found for PDF: $e');
        return null;
      }
    } catch (e) {
      print('Error parsing PDF: $e');
      return null;
    }
  }
  
  /// Generate a template PDF with instructions
  static Future<Uint8List> generateTemplatePdf() async {
    final pdf = pw.Document();
    
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('PDF Template - See companion _data.json file'),
          );
        },
      ),
    );
    
    return pdf.save();
  }
}

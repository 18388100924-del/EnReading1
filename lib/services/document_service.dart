import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/document.dart';
import 'csv_parser.dart';
import 'pdf_parser.dart';

class DocumentService {
  /// Load all documents from assets/documents/
  /// Supports: .json, .csv, .pdf formats
  static Future<List<Document>> loadDocuments() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      
      // Find all document files (json, csv, pdf)
      // Note: PDF support is disabled on Web platform due to compatibility issues
      final documentPaths = manifestMap.keys
          .where((String key) => 
              key.startsWith('assets/documents/') && 
              (key.endsWith('.json') || key.endsWith('.csv') || (kIsWeb ? false : key.endsWith('.pdf'))))
          .where((String key) => !key.endsWith('_data.json')) // Exclude PDF companion files
          .toList();

      List<Document> documents = [];
      for (String path in documentPaths) {
        Document? doc;
        
        if (path.endsWith('.json')) {
          doc = await _loadJsonDocument(path);
        } else if (path.endsWith('.csv')) {
          doc = await CsvParser.parseCsv(path);
        } else if (path.endsWith('.pdf') && !kIsWeb) {
          doc = await PdfParser.parsePdf(path);
        }
        
        if (doc != null) {
          documents.add(doc);
        }
      }

      return documents;
    } catch (e) {
      print('Error loading documents: $e');
      return [];
    }
  }

  /// Load a specific document by ID
  static Future<Document?> loadDocument(String documentId) async {
    try {
      // Try JSON first
      try {
        return await _loadJsonDocument('assets/documents/$documentId.json');
      } catch (_) {}
      
      // Try CSV
      try {
        return await CsvParser.parseCsv('assets/documents/$documentId.csv');
      } catch (_) {}
      
      // Try PDF (only on non-web platforms)
      if (!kIsWeb) {
        try {
          return await PdfParser.parsePdf('assets/documents/$documentId.pdf');
        } catch (_) {}
      }
      
      print('Document not found: $documentId');
      return null;
    } catch (e) {
      print('Error loading document: $e');
      return null;
    }
  }
  
  /// Load JSON document
  static Future<Document?> _loadJsonDocument(String path) async {
    try {
      final String content = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonData = json.decode(content);
      return Document.fromJson(jsonData);
    } catch (e) {
      print('Error loading JSON document: $e');
      return null;
    }
  }
  
  /// Get document format from filename
  static String getDocumentFormat(String filename) {
    if (filename.endsWith('.json')) return 'JSON';
    if (filename.endsWith('.csv')) return 'CSV';
    if (filename.endsWith('.pdf')) return 'PDF';
    return 'Unknown';
  }
}

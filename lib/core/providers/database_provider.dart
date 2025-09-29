import 'package:flutter/foundation.dart';
import '../database/app_database.dart';

class DatabaseProvider extends ChangeNotifier {
  late AppDatabase _database;
  bool _isInitialized = false;

  AppDatabase get database => _database;
  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      _database = AppDatabase();
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing database: $e');
      rethrow;
    }
  }

  @override
  void dispose() {
    if (_isInitialized) {
      _database.close();
    }
    super.dispose();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class HeroSectionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> fetchFeatureData() async {
    try {
      final snapshot = await _firestore.collection('heroImage').limit(3).get();
      return snapshot.docs;
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}


class HeroSectionProvider with ChangeNotifier {
  final HeroSectionService _heroSectionService = HeroSectionService();
  List<DocumentSnapshot> _featureData = [];
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  int _totalPages = 0;

  List<DocumentSnapshot> get featureData => _featureData;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  int get totalPages => _totalPages;

  HeroSectionProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      _featureData = await _heroSectionService.fetchFeatureData();
      _totalPages = _featureData.length;
      _hasError = false;
    } catch (e) {
      _errorMessage = e.toString();
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

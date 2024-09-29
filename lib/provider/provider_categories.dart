// featured_provider.dart
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeaturedProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _products = [];
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  List<Map<String, dynamic>> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

  FeaturedProvider() {
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final snapshot = await _firestore.collection('categories').get();
      _products = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
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

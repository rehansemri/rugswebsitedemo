// latest_product_provider.dart
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LatestProductProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<LatestProductItem> _products = [];
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  List<LatestProductItem> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

  LatestProductProvider() {
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final snapshot = await _firestore.collection('latestProduct').get();
      _products = snapshot.docs.map((doc) {
        return LatestProductItem(
          image: doc['image'] ?? '',
          name: doc['name'] ?? '',
        );
      }).toList();
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

class LatestProductItem {
  final String image;
  final String name;

  LatestProductItem({
    required this.image,
    required this.name,
  });
}

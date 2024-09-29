// recent_product_provider.dart
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecentProductProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<RecentProductItem> _products = [];
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  List<RecentProductItem> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

  RecentProductProvider() {
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final snapshot = await _firestore.collection('recentProduct').get();
      _products = snapshot.docs.map((doc) {
        return RecentProductItem(

          image: doc['image'] ?? '',
          name: doc['name'] ?? '',
          
          price: doc['price'] ?? '',
          size: doc['size'] ?? '',
          id: doc.id,
          description:  doc['description'] ?? 'A painting of the cosmos, the Genesis collection is an interpretation of what our worlds would look like before they couldn’t even be seen. The collection showcases pastel colors and vague shapes coexist with the hopes of blending into a concrete idea. Made from the finest quality wool and viscose, each rug is precisely hand-tufted by experienced artisans. Designed with resilience against everyday wear and tear, the collection is perfect for any room in your house.',
          additionalInfo: doc['additionalInfo'] ?? 'A painting of the cosmos, the Genesis collection is an interpretation of what our worlds would look like before they couldn’t even be seen. The collection showcases pastel colors and vague shapes coexist with the hopes of blending into a concrete idea. Made from the finest quality wool and viscose, each rug is precisely hand-tufted by experienced artisans. Designed with resilience against everyday wear and tear, the collection is perfect for any room in your house.'
          
          
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

class RecentProductItem {
  final List image;
  final String name;
  final String price;
  final String size;
  final String additionalInfo;
  final String description;
   final String id;

  RecentProductItem({

    required this.image,
    required this.name,
    required this.description,
    required this.additionalInfo,
    required this.price,
    required this.size,
    required this.id
  });
}

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogoProvider with ChangeNotifier {
  String? _logoUrl;
  String? get logoUrl => _logoUrl;

  LogoProvider() {
    _fetchLogoUrl();
  }

  Future<void> _fetchLogoUrl() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('logoImage')
          .doc('logo2')
          .get();
      _logoUrl = snapshot['image']; // Assuming 'image' is the key for the logo URL
      notifyListeners();
    } catch (e) {
      // Handle error
      print("Error fetching logo URL: $e");
    }
  }
}

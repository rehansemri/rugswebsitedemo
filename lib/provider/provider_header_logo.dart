import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeaderProvider extends ChangeNotifier {
  String? _logoUrl;
  bool _navList = false;

  // Navigation items
  final List<Map<String, dynamic>> _navItems = [
    {'path': '/home', 'text': 'Home'},
    {'path': '/about', 'text': 'About'},
    {'path': '/services', 'text': 'Services'},
    {'path': '/contact', 'text': 'Contact'},
  ];

  String? get logoUrl => _logoUrl;
  bool get navList => _navList;
  List<Map<String, dynamic>> get navItems => _navItems;

  HeaderProvider() {
    _fetchLogoUrl();
  }

  Future<void> _fetchLogoUrl() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('logoImage')
          .doc('logo1')
          .get();
      _logoUrl = snapshot['image'];
      notifyListeners();
    } catch (e) {
      // Handle error
      print("Error fetching logo URL: $e");
    }
  }

  void toggleNavList() {
    _navList = !_navList;
    notifyListeners();
  }
}

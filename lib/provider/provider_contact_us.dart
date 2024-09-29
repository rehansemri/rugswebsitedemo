import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ContactUsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> fetchContactUsDetails() async {
    DocumentSnapshot docSnapshot =
        await _firestore.doc('/contactusDetails/contactus').get();
    if (docSnapshot.exists) {
      return docSnapshot.data() as Map<String, dynamic>;
    } else {
      throw Exception('Document does not exist');
    }
  }
}


class ContactUsProvider with ChangeNotifier {
  final ContactUsService _contactUsService = ContactUsService();
  Map<String, dynamic>? _contactData;
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  Map<String, dynamic>? get contactData => _contactData;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

  ContactUsProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      _contactData = await _contactUsService.fetchContactUsDetails();
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

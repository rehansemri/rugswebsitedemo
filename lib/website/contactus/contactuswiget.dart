import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_contact_us.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactUsProvider = Provider.of<ContactUsProvider>(context);

    if (contactUsProvider.isLoading) {
      return Center(child: Container());
    } else if (contactUsProvider.hasError) {
      return Center(child: Text('Error: ${contactUsProvider.errorMessage}'));
    } else if (contactUsProvider.contactData != null) {
      final contactData = contactUsProvider.contactData!;
      final screenSize = MediaQuery.of(context).size;
      final isSmallScreen = screenSize.width < 600;

      return Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
'https://images.pexels.com/photos/1033729/pexels-photo-1033729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' 
,             fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 20 : 40,
                  horizontal: isSmallScreen ? 16 : 32,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF1d2636).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: isSmallScreen
                    ? Column(
                        children: [
                          _buildCompanyDetails(contactData),
                          SizedBox(height: 32), // Space between details and form
                          _buildContactForm(screenSize),
                        ],
                      )
                    : Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: _buildCompanyDetails(contactData),
                          ),
                          SizedBox(width: 32), // Space between details and form
                          Flexible(
                            flex: 2,
                            child: _buildContactForm(screenSize),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text('No Data Found'));
    }
  }

  Widget _buildCompanyDetails(Map<String, dynamic> contactData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Name: ${contactData['name']}',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Address: ${contactData['address']}',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Phone: ${contactData['phone']}',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Email: ${contactData['email']}',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm(Size screenSize) {
    final isSmallScreen = screenSize.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'We would love to hear from you!',
          style: TextStyle(
            fontSize: isSmallScreen ? 22 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          'Fill out the form below and we will get back to you as soon as possible.',
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 16,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32),
        TextField(
          decoration: InputDecoration(
            labelText: 'Name',
             labelStyle: TextStyle(
        color:Colors.white
      ),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
             labelStyle: TextStyle(
        color:Colors.white
      ),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            labelText: 'Message',
             labelStyle: TextStyle(
        color:Colors.white
      ),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Handle form submission
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 12 : 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: isSmallScreen ? 16 : 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

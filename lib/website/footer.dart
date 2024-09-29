import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/provider_footer.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double padding = constraints.maxWidth * 0.05; // 5% of screen width
        bool isSmallScreen = constraints.maxWidth < 800;

        final logoUrl = Provider.of<LogoProvider>(context).logoUrl;

        return Column(
          children: [
            // Footer Main Section
            Container(
              color: Color(0xFF1d2636),
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: [
                    // Fetch and display logo from provider
                    logoUrl != null
                        ? Image.network(logoUrl!, width: 150)
                        : CircularProgressIndicator(), // Show a loading indicator
                    SizedBox(height: 30),
                    Text(
                      'Do You Need Help With Anything?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 0.5, // More professional look
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Receive updates, hot deals, tutorials, and discounts straight to your inbox every month.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        height: 1.7, // Improve readability
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.4,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF1d2636),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                          ),
                          child: Text(
                            'Subscribe',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),

                    // Social Media Icons with spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.facebookF, size: 28),
                          color: Colors.white,
                          onPressed: () async{
 await launchUrl(Uri.parse('https://www.facebook.com/') );
                          },
                        ),
                        SizedBox(width: 20), // Space between icons
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter, size: 28),
                          color: Colors.white,
                          onPressed: () {
                            // Add link to Twitter
                          },
                        ),
                        SizedBox(width: 20),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.instagram, size: 28),
                          color: Colors.white,
                          onPressed: () {
                            // Add link to Instagram
                          },
                        ),
                        SizedBox(width: 20),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedinIn, size: 28),
                          color: Colors.white,
                          onPressed: () {
                            // Add link to LinkedIn
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                  ],
                ),
              ),
            ),

            // Footer Copyright Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF1d2636),
              child: Column(
                children: [
                  Text(
                    '© 2024 Rugs Space. All Rights Reserved.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Privacy Policy | Terms & Conditions',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

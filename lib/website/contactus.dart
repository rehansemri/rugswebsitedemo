



import 'package:flutter/material.dart';

import 'contactus/contactuswiget.dart';
import 'footer.dart';
import 'header.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [Header(),
         ContactUs(),
            
             Footer(),
             ],
        ),
      )),
    );
  }
}

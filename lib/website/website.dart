import 'package:flutter/material.dart';
import 'package:website/website/categories/categories.dart';
import 'package:website/website/header.dart';
import 'package:website/website/hero/hero.dart';
import 'package:website/website/recent/recent.dart';

import 'awarded/awarded.dart';
import 'footer.dart';
import 'location/location.dart';

class WebsiteMainPage extends StatefulWidget {
  const WebsiteMainPage({super.key});

  @override
  State<WebsiteMainPage> createState() => _WebsiteMainPageState();
}

class _WebsiteMainPageState extends State<WebsiteMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Header(),
             HeroSection(),
              Recent(),Location(), 
                Featured(),
              Awards(),
              
               Footer(),
               ],
          ),
        ),
      )),
    );
  }
}

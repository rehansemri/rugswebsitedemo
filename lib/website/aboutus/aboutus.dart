



import 'package:flutter/material.dart';

import '../awarded/awarded.dart';
import '../footer.dart';
import '../header.dart';
import '../map/maps_widget.dart';
import 'aboutus_widget.dart';



class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [Header(),
            AboutUsWidget(),

              Awards(),
              MapsWidget(),
             Footer(),
             ],
        ),
      )),
    );
  }
}

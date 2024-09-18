import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HeroSection extends StatefulWidget {
  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late final Timer _autoSlideTimer;

@override
void initState() {
  super.initState();
  // Start the auto-slide timer
  _autoSlideTimer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    if (_pageController.hasClients) {
      int nextPage = (_currentPage + 1) % 3; // Assuming 3 images
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _currentPage = nextPage; // Update the current page
    }
  });
}

  List<Map<String, dynamic>> FeatureData = [
    {
      "image": "images/",
      "heading": "Rugs Space Handmade Carpets",
      "subHeading":
          "Rugs Space. is India’s leading manufacturer and exporter of Handmade Woolen, Cotton & Viscose carpets, Textile items such as Cushions, Poufs, Bathmats, Throws.We are a leading exporter of carpets to several destinations across the world…"
    },
    {
      "image": "images/",
      "heading": "The Craftmanship Behind Our Rugs",
      "subHeading":
          "We take great pride in every project and look forward to putting our expertise to work for you. From production and fiber dyeing to design and weaving, Saif Handmade Carpets celebrates complete supply chain autonomy and maintains absolute"
    },
    {
      "image": "images/",
      "heading": "In House Production",
      "subHeading":
          "We are proud to accomplish an entirely in-house production. Right from the start of designing, weaving production to packaged carpets delivered at your doorstep.The company acquired 21060 sq. Our production level is followed by optimal quality standards…"
    },
    {
      "image": "images/",
      "heading": "CARPETS",
      "subHeading":
          "Vibrant colors and bold patterns from Rugs Handmade Carpets add a lively flourish of luxury and character to any space. With these elegant selections in-stock and available now, you can finish your project quickly and beautifully at Saif Handmade Carpets."
    },
  ];
  @override
  void dispose() {
    _autoSlideTimer.cancel();
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: screenWidth,
          height:screenWidth<600?screenHeight: screenHeight * 0.75, // Adjust the height as needed
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              for (int i = 0; i < FeatureData.length; i++) // Assuming 3 images
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          '${FeatureData[i]["image"]}banner${i + 1}.webp'), // Update image path
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 80,horizontal: screenWidth<600?10:80),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width:screenWidth<400?double.infinity:screenWidth<600?screenWidth *0.8: screenWidth *
                            0.6, // Adjust width of the white container
                        padding: EdgeInsets.all(20),
                        color: Color(0xFF1d2636).withOpacity(0.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${FeatureData[i]["heading"]}',
                              style: TextStyle(
                                fontSize:  30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${FeatureData[i]["subHeading"]}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 3, // Number of images
            effect: WormEffect(
              dotWidth: 16,
              dotHeight: 16,
              spacing: 32,
              activeDotColor: Color(0xFF1d2636),
              dotColor: Colors.grey,
            ),
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }
}

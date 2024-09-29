import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../provider/provider_hero_section.dart';

class HeroSection extends StatefulWidget {
  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

void _startAutoSlide() {
  _autoSlideTimer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    final provider = Provider.of<HeroSectionProvider>(context, listen: false);
    if (_pageController.hasClients && mounted && provider.totalPages > 0) {
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 2000),
        curve: Curves.easeInOut,
      );
      if (_currentPage < provider.totalPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    }
  });
}

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HeroSectionProvider>(context);

    if (provider.isLoading) {
      return Center(child: Container());
    } else if (provider.hasError) {
      return Center(child: Text('Error: ${provider.errorMessage}'));
    } else if (provider.featureData.isEmpty) {
      return Center(child: Text('No Data Found'));
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: screenWidth,
          height: screenWidth < 600 ? screenHeight : screenHeight * 0.75,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: provider.totalPages,
            itemBuilder: (context, index) {
              final data = provider.featureData[index].data() as Map<String, dynamic>;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data['image']),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 80,
                      horizontal: screenWidth < 600 ? 10 : 80),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: screenWidth < 400
                          ? double.infinity
                          : screenWidth < 600
                              ? screenWidth * 0.8
                              : screenWidth * 0.6,
                      padding: EdgeInsets.all(20),
                      color: Color(0xFF1d2636).withOpacity(0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data["heading"]}',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${data["subHeading"]}',
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
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: provider.totalPages,
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

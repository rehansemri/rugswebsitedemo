import 'package:flutter/material.dart';
import 'package:website/website/constant/constant.dart';

class Awards extends StatelessWidget {
  final List<Award> awards = [
    Award(icon: Icons.location_city, num: '30+', name: 'Countries'),
    Award(icon: Icons.store, num: '200+', name: 'Collections'),
    Award(icon: Icons.category, num: '400+', name: 'Accessories'),
    Award(icon: Icons.man, num: '120+', name: 'Clients'),
    // Add more awards here
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine screen width and adjust parameters accordingly
        double itemWidth;
        double iconSize;
        double numFontSize;
        double nameFontSize;
        double horizontalPadding;
        double spacing;

        if (screenWidth > 1200) {
          // Large screens (Desktops)
          itemWidth = 150.0;
          iconSize = 60.0;
          numFontSize = 50.0;
          nameFontSize = 20.0;
          horizontalPadding = 40.0;
          spacing =120.0;
        } else if (screenWidth > 830) {
          // Medium screens (Tablets)
          itemWidth = 120.0;
          iconSize = 50.0;
          numFontSize = 40.0;
          nameFontSize = 18.0;
          horizontalPadding = 30.0;
          spacing = 75.0;
        } else {
          // Small screens (Mobile)
          itemWidth = 100.0;
          iconSize = 40.0;
          numFontSize = 30.0;
          nameFontSize = 16.0;
          horizontalPadding = 16.0;
          spacing = 40.0;
        }

        return Container(
          color: Colors.white, // Background color
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: horizontalPadding), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Heading widget
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Our Customers',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: headingSize, // Keep heading responsive with headingSize
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Over 10000+ Happy Users Being With Us Still They Love Our Services',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: subHeadingSize, // Keep subheading responsive with subHeadingSize
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 60), // Adjust space between heading and content

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 10 : horizontalPadding),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      spacing: spacing, // Space between items dynamically adjusted
                      runSpacing: 40.0, // Space between rows
                      alignment: WrapAlignment.center, // Center align the columns
                      children: [
                        for (int i = 0; i < awards.length; i++)
                          Container(
                            width: itemWidth, // Responsive width based on screen size
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: itemWidth, // Square container for icon
                                  height: itemWidth,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      awards[i].icon,
                                      size: iconSize, // Responsive icon size
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10), // Space between icon and text
                                Text(
                                  awards[i].num,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: numFontSize, // Responsive number font size
                                  ),
                                ),
                                Text(
                                  awards[i].name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: nameFontSize, // Responsive name font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}

class Award {
  final IconData icon;
  final String num;
  final String name;

  Award({required this.icon, required this.num, required this.name});
}

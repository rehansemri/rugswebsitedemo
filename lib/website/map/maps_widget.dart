import 'package:flutter/material.dart';

import '../constant/constant.dart';
import 'maps_embbided.dart';

class MapsWidget extends StatelessWidget {
  const MapsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
              children: [
                SizedBox(height: 60),
                Text(
                  'Locate on maps',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:
                        headingSize, // Keep heading responsive with headingSize
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Find Us Here: Explore Our Location on Google Maps for Easy Navigation and Directions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:
                        subHeadingSize, // Keep subheading responsive with subHeadingSize
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                Container(
                    height: 500,
                    child: GMapsHtml(
                        url:
                            "https://maps.google.com/maps?q=25.397318, 82.572914&z=18&output=embed")),
              ],
            );
  }
}
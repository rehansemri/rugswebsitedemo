import 'package:flutter/material.dart';
import 'package:website/website/constant/constant.dart';

class Location extends StatelessWidget {
  final List<LocationItem> location = [
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),
    LocationItem(
      cover: 'product/', // Sample image URL
      name: 'Beachside Villas',
      villas: '15',
      offices: '3',
      apartments: '20',
    ),

    // Add more LocationItem objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine number of columns based on screen width
   

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         SizedBox(height: headingPadding),
        Text(
          'Explore More ',
          style: TextStyle(
            fontSize: headingSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'our latest product',
          style: TextStyle(
            color: Colors.grey,
            fontSize: subHeadingSize,
          ),
        ),
         SizedBox(height: headingPadding),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:screenWidth<700?10: globalPadding),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Disable scrolling
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:screenWidth<600?(screenWidth/200).toInt(): ( screenWidth/300).toInt(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: screenWidth > 800
                  ? 1.5
                  : 1.1, // Adjust aspect ratio for smaller screens
            ),
            itemCount: location.length,
            itemBuilder: (context, index) {
              final item = location[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      '${item.cover}${index + 1}.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              'Image not available',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth > 600
                                ? 18.0
                                : 16.0, // Adjust font size based on screen width
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Villas: ${item.villas}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                           
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class LocationItem {
  final String cover;
  final String name;
  final String villas;
  final String offices;
  final String apartments;

  LocationItem({
    required this.cover,
    required this.name,
    required this.villas,
    required this.offices,
    required this.apartments,
  });
}

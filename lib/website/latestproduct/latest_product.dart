import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/website/constant/constant.dart';

import '../../provider/provider_latest_product.dart';

class LatestProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final latestProductProvider = Provider.of<LatestProductProvider>(context);

    if (latestProductProvider.isLoading) {
      return Center(child: Container());
    } else if (latestProductProvider.hasError) {
      return Center(child: Text('Error: ${latestProductProvider.errorMessage}'));
    } else if (latestProductProvider.products.isEmpty) {
      return Center(child: Text('No products available.'));
    }

    final products = latestProductProvider.products;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20.0),
        Text(
          'Explore More',
          style: TextStyle(
            fontSize: headingSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Our latest products',
          style: TextStyle(
            color: Colors.grey,
            fontSize: subHeadingSize,
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth < 700 ? 10 : 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth < 600 ? (screenWidth / 200).toInt() : (screenWidth / 300).toInt(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: screenWidth > 800 ? 1.5 : 1.1,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      item.image,
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
                            fontSize: screenWidth > 600 ? 18.0 : 16.0,
                            fontWeight: FontWeight.w500,
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
      ],
    );
  }
}

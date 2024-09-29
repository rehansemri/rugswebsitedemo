// featured.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/website/constant/constant.dart';

import '../../provider/provider_categories.dart';

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final featuredProvider = Provider.of<FeaturedProvider>(context);

    if (featuredProvider.isLoading) {
      return Center(child: Container());
    } else if (featuredProvider.hasError) {
      return Center(child: Text('Error: ${featuredProvider.errorMessage}'));
    } else if (featuredProvider.products.isEmpty) {
      return Center(child: Text('No products available.'));
    }

    final products = featuredProvider.products;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20), // Adjust based on your constant value
        Heading(
          title: 'Category',
          subtitle: 'Find All Types of Categories.',
        ),
        SizedBox(height: 20), // Adjust based on your constant value
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width < 700 ? 10 : 20),
          child: RecentCard(products: products),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Heading extends StatelessWidget {
  final String title;
  final String subtitle;

  Heading({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: headingSize, // Adjust font size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: subHeadingSize, // Adjust font size
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class RecentCard extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const RecentCard({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth / 180;
    final childAspectRatio = screenWidth < 600 ? 0.8 : 1.0;

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount.toInt(),
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(item['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                item['name'] ?? 'No Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}

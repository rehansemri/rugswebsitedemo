import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:website/website/constant/constant.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  int currentPage = 1;
  int itemsPerPage = 6;

  final List<Map<String, dynamic>> products = List.generate(8, (index) {
    return {
      "cover": "product/",
      "category": "Categories",
    };
  });

  @override
  Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: headingPadding),
        Heading(
          title: 'Category',
          subtitle: 'Find All Types of Categories.',
        ),
        SizedBox(height: headingPadding),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:screenWidth<700?10: globalPadding ),
          child: RecentCard(products:  products),
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
            fontSize: headingSize, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:subHeadingSize, // Responsive font size
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

    // Adjust number of columns based on screen size
    final crossAxisCount = screenWidth / 180;

    // Set the child aspect ratio for keeping items square or adjustable
    final childAspectRatio = screenWidth < 600 ? 0.8 : 1.0;

    return  GridView.builder(
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
                // Background image with blur effect
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('${item['cover']}${index + 1}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
                // Centered text on top of the background image
                Center(
                  child: Text(
                    item['category'],
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

class Pagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return InkWell(
          onTap: () {
            onPageChanged(index + 1);
          },
          child: Container(
            padding: EdgeInsets.all(isSmallScreen ? 4.0 : 8.0),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              color: currentPage == index + 1 ? Colors.blue : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: isSmallScreen ? 12 : 16,
                color: currentPage == index + 1 ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }
}

// recent.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/provider_recent_product.dart';
import '../constant/constant.dart';
import 'product_page.dart';

class Recent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recentProductProvider = Provider.of<RecentProductProvider>(context);

    if (recentProductProvider.isLoading) {
      return Center(child: Container());
    } else if (recentProductProvider.hasError) {
      return Center(child: Text('Error: ${recentProductProvider.errorMessage}'));
    } else if (recentProductProvider.products.isEmpty) {
      return Center(child: Text('No products available.'));
    }

    final products = recentProductProvider.products;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: headingPadding),
          Heading(
            title: 'Recent Products',
            subtitle: 'Browse our collection of recently listed products.',
          ),
          SizedBox(height: headingPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 10 : globalPadding),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (screenWidth / 300).round(),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: screenWidth < 600 ? 0.65 : 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return InkWell(
                  onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductDetailsPage(productId:item.id))),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Image.network(
                              item.image[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              SizedBox(height: 8),
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.aspect_ratio,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    item.size,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                               'INR ${item.price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: headingSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: subHeadingSize,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

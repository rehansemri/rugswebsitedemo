import 'package:flutter/material.dart';
import 'package:website/website/constant/constant.dart';

class Recent extends StatefulWidget {
  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  int currentPage = 1;
  int itemsPerPage = 6;

  final List<Map<String, dynamic>> products = List.generate(14, (index) {
    return {
      "cover": "product/",
      "category": index % 2 == 0 ? "For Sale" : "For Rent",
      "size": "1280x720",
      "name": "Product ${index + 1} with a very long name that needs to be truncated",
      "price": "\INR ${(index + 1) * 1000}",
      
    };
  });

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
           SizedBox(height: headingPadding),
          Heading(
            title: 'Recent Products',
            subtitle: 'Browse our collection of recently listed properties.',
          ),
           SizedBox(height: headingPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:screenWidth<700?10: globalPadding),
            child: RecentCard(
              products: products,
            ),
          ),
          SizedBox(height: 16),
         
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

class RecentCard extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  RecentCard({required this.products});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:( MediaQuery.of(context).size.width / 250).round(),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: MediaQuery.of(context).size.width < 600 ? 0.65 : 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            return Container(
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
                  // Image section wrapped in Expanded to avoid overflow
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Image.asset(
                        '${item['cover']}${index + 1}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                           
                            Spacer(),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['name'],
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
                              item['size'],
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
                          item['price'],
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
            );
          },
        );
      },
    );
  }
}


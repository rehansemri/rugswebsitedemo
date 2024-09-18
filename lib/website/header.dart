import 'package:flutter/material.dart';
import 'package:website/website/constant/constant.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool navList = false;

  List<Map<String, dynamic>> nav = [
    {'path': '/home', 'text': 'Home'},
    {'path': '/about', 'text': 'About'},
    {'path': '/services', 'text': 'Services'},
    {'path': '/contact', 'text': 'Contact'}
  ];

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 22, 84, 0.1),
            offset: Offset(0, 5),
            blurRadius: 30,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: screenWidth<600?10: globalPadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 600
              ? _buildSmallScreenHeader()
              : _buildLargeScreenHeader();
        },
      ),
    );
  }

  Widget _buildSmallScreenHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/logo.png',
              width: 150,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  navList = !navList;
                });
              },
              icon: Icon(
                navList ? Icons.close : Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
        if (navList)
          Column(
            children: nav.map((list) {
              return ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, list['path']!);
                  },
                  child: Text(
                    list['text']!,
                    style: TextStyle(
                      color: Colors.black,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

Widget _buildLargeScreenHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        'images/logo.png',
        width: 170,
      ),
      Row(
        children: nav.map((list) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the spacing
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, list['path']!);
              },
              child: Text(
                list['text']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ],
  );
}

}

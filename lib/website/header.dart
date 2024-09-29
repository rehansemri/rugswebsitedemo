import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/website/website.dart';
import '../provider/provider_header_logo.dart';
import 'constant/constant.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final headerProvider = Provider.of<HeaderProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 22, 84, 0.1),
            offset: Offset(0, 5),
            blurRadius: 30,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: screenWidth < 600 ? 10 : globalPadding,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 600
              ? _buildSmallScreenHeader(context, headerProvider)
              : _buildLargeScreenHeader(context, headerProvider);
        },
      ),
    );
  }

  Widget _buildSmallScreenHeader(BuildContext context, HeaderProvider provider) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display logo from provider
            provider.logoUrl != null
                ? InkWell(
                  onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>WebsiteMainPage())),
                  child: Image.network(provider.logoUrl!, width: 150))
                : Container(), // Display loading indicator until logo is fetched
            IconButton(
              onPressed: () {
                provider.toggleNavList();
              },
              icon: Icon(
                provider.navList ? Icons.close : Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
        if (provider.navList)
          Column(
            children: provider.navItems.map((list) {
              return ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, list['path']!);
                      provider.toggleNavList();
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

  Widget _buildLargeScreenHeader(BuildContext context, HeaderProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Display logo from provider
        provider.logoUrl != null
            ? Image.network(provider.logoUrl!, width: 170)
            : Container(), // Display loading indicator until logo is fetched
        Row(
          children: provider.navItems.map((list) {
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

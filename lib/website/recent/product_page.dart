

import 'package:flutter/material.dart';
import 'package:website/website/categories/categories.dart';
import 'package:website/website/header.dart';
import 'package:website/website/hero/hero.dart';
import 'package:website/website/recent/product_details_widget.dart';
import 'package:website/website/recent/recent.dart';

import '../awarded/awarded.dart';
import '../footer.dart';
import '../orderform/order_form.dart';



class ProductDetailsPage extends StatefulWidget {
   final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
      
             ProductDetailsWidget(productId: widget.productId,),
             OrderForm(),
            Awards(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

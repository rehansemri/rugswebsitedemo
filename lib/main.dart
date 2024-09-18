import 'package:flutter/material.dart';
import 'package:website/website/contactus.dart';
import 'package:website/website/website.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
    '/home': (context) => WebsiteMainPage(),
    '/about': (context) => WebsiteMainPage(),
    '/services': (context) => WebsiteMainPage(),
    '/contact': (context) =>  ContactUsPage(),
  },
      theme: ThemeData(
      
       
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1d2636)),
        useMaterial3: true,
      ),
      home: WebsiteMainPage(),
    );
  }
}

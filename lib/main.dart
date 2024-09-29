import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/website/aboutus/aboutus.dart';
import 'package:website/website/contactus.dart';
import 'package:website/website/website.dart';
import 'firebase_options.dart';
import 'provider/provider_categories.dart';
import 'provider/provider_contact_us.dart';
import 'provider/provider_footer.dart';
import 'provider/provider_header_logo.dart';
import 'provider/provider_hero_section.dart';
import 'provider/provider_latest_product.dart';
import 'provider/provider_recent_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HeroSectionProvider()),
        ChangeNotifierProvider(create: (context) => ContactUsProvider()),
        ChangeNotifierProvider(create: (context) => FeaturedProvider()),
        ChangeNotifierProvider(create: (context) => LatestProductProvider()),
        ChangeNotifierProvider(create: (context) => RecentProductProvider()),
        ChangeNotifierProvider(create: (context) => HeaderProvider()),
        ChangeNotifierProvider(create: (context) => LogoProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rugs Website Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => WebsiteMainPage(),
        '/about': (context) => AboutUsPage(),
        // '/services': (context) => WebsiteMainPage(),
        '/contact': (context) => ContactUsPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1d2636)),
        useMaterial3: true,
      ),
      home: WebsiteMainPage(),
    );
  }
}

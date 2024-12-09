import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/MainScreens/Splash.dart';
import 'package:shopping/MainScreens/eq.dart';
import 'package:shopping/MainScreens/home_page.dart';
import 'package:shopping/MainScreens/next_screen.dart';
import 'package:shopping/auth_pages/login_page.dart';
import 'package:shopping/auth_pages/signUp.dart';

Future<void> main() async {
  // final change bob = change("Bob");

  // plugin.initialize(publicKey: publicKey);
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = stripePublishableKey;
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}

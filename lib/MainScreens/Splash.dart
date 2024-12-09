import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/auth_pages/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  void initState() {
    // Timer(Duration(seconds: 4), () {
    //   Get.off(LoginPage());
    // });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber.shade50,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
                child: Row(
              children: [
                Lottie.asset('images/wel.json', height: 80),
                Text(
                  'Online Shopping Store',
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 22,
                      fontWeight: FontWeight.w900),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gosign/features/login/presentation/pages/login_page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: Center(
              child: Image.asset(
                'assets/images/ic_logo_full.webp',
                width: 250,
                height: 200,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/ic_bg.webp',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

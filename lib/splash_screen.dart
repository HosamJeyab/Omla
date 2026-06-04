import 'dart:async';
import 'package:flutter/material.dart';
import 'package:omla/core/const/app_color.dart';
import 'package:omla/view/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.backgroundColor, AppColor.primaryColor],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 150,
              left: 50,
              child: Opacity(
                opacity: 0.1,
                child: Icon(
                  Icons.currency_exchange,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),

            Positioned(
              bottom: 200,
              right: 60,
              child: Opacity(
                opacity: 0.1,
                child: Icon(Icons.security, size: 80, color: Colors.white),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 100,

                      backgroundColor: Colors.white.withAlpha(10),
                      child: Image.asset(
                        'assets/images/logo_trans.png',
                        width: 500,
                        height: 500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'INSTITUTIONAL PRECISION',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 2,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'SECURE CONNECTION...',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

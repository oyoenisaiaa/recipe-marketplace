import 'dart:async';
import 'package:cookpedia/profile_screen.dart';
import 'package:flutter/material.dart';

//splash screen class
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//splash screen state
class _SplashScreenState extends State<SplashScreen> {
  late Timer timer; //to hold timer object
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) {
        return;
      } //check if the widget is still mounted and if not, return to initial state and ignore rest of the code
      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    });
  }

  @override
  void dispose() {
    timer.cancel(); //if screen is disposed - user closes the app or error in loading, cancel or stop the timer from starting at all
    super.dispose();
  }

  //build starts
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/splash.png', fit: BoxFit.cover),
          ),

          //dark overlay
          //Container(color: Colors.black.withValues(alpha: 0.05)),

          //content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // Text(
                //   'Cookpedia Marketplace App',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 28,
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                SizedBox(height: 30),

                CircularProgressIndicator(color: Colors.redAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

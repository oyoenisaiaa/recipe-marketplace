import 'package:cookpedia/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) {
        return;
      } //also written as - if (!mounted) return

      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  //precache image for faster loading on other screens if needed because of slow internet
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
      const NetworkImage(
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=200&h=200&fit=crop',
      ),
      context,
    );
  }

  //timer = Timer(const Duration(seconds: 3), () {
  //       if (!mounted) {
  //         return;
  //       } //check if the widget is still mounted and if not, return to initial state and ignore rest of the code
  //       setState(() {
  //         isLoading = false;
  //       });

  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const LoginScreen()),
  //       );
  //     });
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //changed to network image centered on screen
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=200&h=200&fit=crop',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,

                      //showing loader while image loads
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          //i.e image has loaded
                          return child; //i.e child is the image
                        }
                        //where image is not null i.e still loading
                        return SizedBox(
                          width: 160,
                          height: 160,
                          child: Center(
                            child: LoadingAnimationWidget.dotsTriangle(
                              color: Colors.redAccent,
                              size: 50,
                            ),
                            // child: CircularProgressIndicator(
                            //   color: Colors.redAccent,
                            // ),
                          ),
                        );
                      },

                      //fallback icon in case image fails to load
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.menu_book_rounded,
                        size: 120,
                        color: Colors.cyan.shade600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    'Cookpedia',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //red circular progress indicator at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: LoadingAnimationWidget.hexagonDots(
              //threeRotatingDots(//discreteCircle( //inkDrop(//staggeredDotsWave(//dotsTriangle(
              color: Colors.redAccent,
              size: 50,
            ),

            // child: CircularProgressIndicator(
            //   color: Colors.redAccent,
            //   strokeWidth: 3,
            //   strokeCap: StrokeCap.round,
            //   backgroundColor: Colors.redAccent.withValues(alpha: 0.15),
            // ),
          ),
        ],
      ),
    );
  }
}

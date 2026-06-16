import 'package:flutter/material.dart';

/// Profile Screen
class PersonalProfileScreen extends StatelessWidget {
  const PersonalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              /// Profile Image
              const CircleAvatar(
                radius: 60,
                backgroundImage:
                    AssetImage("assets/launcher_icon.png"),
              ),

              const SizedBox(height: 15),

              /// Full Name
              const Text(
                "Oyoenisai Andrew-Essien",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              /// Bio
              const Text(
                "Senior Marketing Executive transitioning into Front-End Development and Mobile App Development. Passionate about technology, AI, and creating impactful digital solutions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 25),

              /// Food Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/launcher_icon.png",
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Delicious Seafood Platter",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// Icons Row
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: const [

                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 35,
                  ),

                  Icon(
                    Icons.restaurant,
                    color: Colors.orange,
                    size: 35,
                  ),

                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 35,
                  ),

                  Icon(
                    Icons.share,
                    color: Colors.blue,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
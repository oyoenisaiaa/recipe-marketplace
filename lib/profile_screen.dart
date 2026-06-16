import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //addition to UI - FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Chat feature coming soon!')),
          );
        },
      ),

      //addition to UI - bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index != 1) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Feature coming soon!')),
            );
          }
        },
        //nav item list
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //profile screen header and title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 30),

                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //setState added per task requirement
                    //Icon(Icons.more_horiz),
                    IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () {
                        //setState(() {}); //to toggle options menu visibility
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Feature coming soon!')),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                //profile image and data
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/chef.webp'),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            ProfileData(title: 'Recipe', value: '12'),
                            //SizedBox(width: 10),
                            ProfileData(title: 'Followers', value: '2.5M'),
                            //SizedBox(width: 10),
                            ProfileData(title: 'Following', value: '259'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                //profile details
                const Text(
                  'Oyoenisai Andrew-Essien', //Ifeyinka Adeyemo - name of chef per image source
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const Text('Chef', style: TextStyle(color: Colors.grey)),

                const SizedBox(height: 14),

                //bio
                const Text(
                  'Seasonal Chef',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),

                const Text(
                  'Passionate about food and life 🍔🍲👨‍🍳',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),

                //setState added per task requirement
                GestureDetector(
                  onTap: () {
                    //setState(() {}); //show full or less _showFullBIO bool if stateful
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Feature coming soon!')),
                    );
                  },
                  child: const Text(
                    'More...',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),

                const SizedBox(height: 25),

                //tabs
                //wrapping children in inkWell to make them clickable and add setState added per task requirement - track _selectedTab and switch active tab styling
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        //setState(() {}); //could set _selectedTab = 0
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Recipe tab selected!')),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal, //current active tab
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: const Text(
                          'Recipe',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    //const Spacer(),
                    //const SizedBox(width: 80),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            onTap: () {
                              //setState(() {}); //could set _selectedTab = 1
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Feature coming soon!'),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              child: const Text(
                                'Videos',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //const SizedBox(width: 100),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        //setState(() {}); //could set _selectedTab = 2
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Feature coming soon!')),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: const Text(
                          'Tag',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                //food cards and details
                FoodCard(
                  image: 'assets/food_cards/party-jollof.webp',
                  title: 'Party Jollof Rice',
                  chef: 'Chef John',
                  isFavorite: true,
                  rating: 4.0,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/fried-rice.webp',
                  title: 'Fried Rice',
                  chef: 'Mark Kelvin',
                  isFavorite: false,
                  rating: 4.0,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/banana_puff-puff.webp',
                  title: 'Banana Puff-Puff',
                  chef: 'Jane Doe',
                  isFavorite: false,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/chin-chin.webp',
                  title: 'Chin-Chin Snack',
                  chef: 'Jane Doe',
                  isFavorite: true,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/cous-cous.webp',
                  title: 'Chickpea & Couscous Vegan Curry',
                  chef: 'Jane Doe',
                  isFavorite: false,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/cuscuz-paulista.webp',
                  title: 'Cuscuz Paulista',
                  chef: 'Jane Doe',
                  isFavorite: false,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/ewedu.webp',
                  title: 'Ewedu, Gbegiri & Stew',
                  chef: 'Jane Doe',
                  isFavorite: false,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/harvard-egusi.webp',
                  title: 'Harvard Egusi Soup',
                  chef: 'Jane Doe',
                  isFavorite: true,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/indian_pav-bhaji.webp',
                  title: 'Indian Pav Bhaji',
                  chef: 'Jane Doe',
                  isFavorite: false,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/injera-ea.webp',
                  title: 'Injera - East African',
                  chef: 'Jane Doe',
                  isFavorite: true,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/suya.webp',
                  title: 'Spicy Nigerian Suya',
                  chef: 'Jane Doe',
                  isFavorite: true,
                  rating: 4.5,
                ),

                const SizedBox(height: 25),

                FoodCard(
                  image: 'assets/food_cards/smokey-jollof.webp',
                  title: 'Smokey Jollof Rice',
                  chef: 'Jane Doe',
                  isFavorite: true,
                  rating: 5.0,
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('More recipes coming soon!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('View More'),
                  ),
                ),

                const SizedBox(height: 90), //bottom padding
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //FAB placed at the end of the screen so it is always visible and does not overlap with the recipe cards or View All text
    );
  }
}

//image sources: https://www.pexels.com and https://www.pexels.com

class ProfileData extends StatelessWidget {
  final String title;
  final String value;

  const ProfileData({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title, //for the recipe, followers, following
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 8),

        Text(
          value, //for the recipe, followers, following
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String chef;
  final bool isFavorite;
  final double rating;

  const FoodCard({
    super.key,
    required this.image,
    required this.title,
    required this.chef,
    required this.isFavorite,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //clickable cards and show dialog even though it is a stateless widget
      borderRadius: BorderRadius.circular(20),

      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text(
              'Recipe Updates',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.teal,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Feature coming soon!'),
                const SizedBox(height: 15),
                const Text('Stay informed about newly released recipes.'),
                const SizedBox(height: 10),

                Switch(
                  value: true,
                  onChanged: null,
                  activeThumbColor: Colors.white,
                  activeTrackColor: Colors.teal,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ],
          ),
        );
      },

      child: ClipRRect(
        child: Stack(
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      //to help make the gradient transparent and text readable
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
                  ),
                ),

                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),

                //card details
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //food title
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 1),

                    //chef name (left), icons(right)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'By $chef',
                          style: const TextStyle(color: Colors.white),
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '20 min',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 8),

                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.bookmark_border,
                                color: Colors.grey.shade800,
                                size: 18,
                              ),
                            ),

                            const SizedBox(width: 8),

                            //addition to UI - favorites
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite
                                    ? Colors.red
                                    : Colors
                                          .grey
                                          .shade800, //if isFavorite is true - red
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 14),
                    const SizedBox(width: 4),
                    Text(rating.toStringAsFixed(1)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

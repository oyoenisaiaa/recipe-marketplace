import 'package:flutter/material.dart';
import 'package:cookpedia/profile_screen.dart';


class MainScreen extends StatefulWidget {
  final String email;
  final String? name; //for home tab to accept name too if user is from registration
  final bool fromLogin; //tracks whether user came from login or register

  const MainScreen({
    super.key,
    required this.email,
    required this.name,
    required this.fromLogin,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  //currently selected bottom nav tab
  int _selectedIndex = 0;

  //list of each tab widget
  List<Widget> get _screens => [

    //home tab - shows welcome message with login details
    _HomeTab(
      email: widget.email,
      name: widget.name,
      fromLogin: widget.fromLogin,
      ),

    //cart tab
    _PlaceholderTab(
      icon: Icons.shopping_cart_outlined,
      label: 'Your Cart',
    ),

    //profile tab - shows name and email from register or login
    ProfileScreen(
      name: widget.fromLogin ? '' : (widget.name ?? ''),
      email: widget.email,
      fromLogin: widget.fromLogin,
    ),

    //notifications tab
    _PlaceholderTab(
      icon: Icons.notifications_none,
      label: 'Notifications',
    ),

    //settings tab
    _PlaceholderTab(
      icon: Icons.settings_outlined,
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //current tab screen
      //body: _screens[_selectedIndex], //rebuilds screen on tab change each time
      body: IndexedStack( //keeps the same screen / its state alive on tab change for future use
        index: _selectedIndex,
        children: _screens,
      ),


      //bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan.shade600,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; //setState updates active/selected tab
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

//home tab widget
class _HomeTab extends StatelessWidget {
  final String email;
  final String? name;
  final bool fromLogin;

  const _HomeTab({
    required this.email, 
    required this.name, 
    required this.fromLogin,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Padding(padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.restaurant_menu, size: 80, color: Colors.cyan),
                const SizedBox(height: 16),
                const Text('Welcome!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                //if not from login and name string is not empty returns true i.e name is not null
                //if name exists, use isNotEmpty and display it but if name is null, use/return false
                //sublist of code is only run if name is not null
                if (!fromLogin && (name?.isNotEmpty ?? false)) ...[
                  Text(
                    name!, //i.e name not passed from register
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                const SizedBox(height: 12),
                ],
                
                Text(
                  email, //email passed from login
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//reusable placeholder tab for cart, notifications, settings screens
class _PlaceholderTab extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PlaceholderTab({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 80, color: Colors.cyan.shade600),
                const SizedBox(height: 16),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
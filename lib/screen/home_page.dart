import 'package:flutter/material.dart';
import 'package:formation_app/style/app_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSidebarOpen = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecole Numerique'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _toggleSidebar();
            },
          ),
        ],
      ),
      body: Row(
        children: [
          if (_isSidebarOpen) Sidebar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.imageHome,
                  height: 180,
                  width: 360,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Lorem Ipsum',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text('Registration'),
                      onPressed: () {
                        // Handle registration button press
                      },
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      child: const Text('Logout'),
                      onPressed: () {
                        // Handle logout button press
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: Column(
          children: [
            const UserAccount(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle profile button press
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('My Training'),
              onTap: () {
                // Handle training button press
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout button press
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserAccountsDrawerHeader(
      accountName: Text('John Doe'),
      accountEmail: Text('john.doe@example.com'),
      currentAccountPicture: CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }
}

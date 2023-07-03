import 'package:flutter/material.dart';
import 'package:formation_app/screen/formation_screen.dart';
import 'package:formation_app/screen/login_screen.dart';
import 'package:formation_app/style/app_colors.dart';
import 'package:formation_app/style/app_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        backgroundColor: AppColors.backColor,
        elevation: 4,
        title: const Text('Ecole Numerique'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _toggleSidebar();
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;

          return Stack(
            // Use Stack widget

            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      AppIcons.imageHome,
                      height: maxHeight * 0.4,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'LOREM IPSUM',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.all(maxWidth > 500 ? 24 : 16),
                              backgroundColor: AppColors.homeColor,
                            ),
                            child: const Text(
                              'Se Connecter',
                              style: TextStyle(
                                fontSize: 36,
                                color: AppColors.backColor,
                              ),
                            ),
                            onPressed: () {
                              // Handle login button press
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                          ),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(
                                  color: AppColors.homeColor,
                                  width: 3.0,
                                ),
                              ),
                              padding: EdgeInsets.all(maxWidth > 600 ? 24 : 16),
                            ),
                            child: const Text(
                              "S'inscrire",
                              style: TextStyle(
                                fontSize: 36,
                                color: AppColors.homeColor,
                              ),
                            ),
                            onPressed: () {
                              // Handle signup button press
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (_isSidebarOpen) Sidebar(),
            ],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Sidebar extends StatelessWidget {
  String dropdownValue = 'Mes Formations';

  Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close the sidebar when tapped outside
        Navigator.pop(context);
      },
      child: Container(
        width: 400,
        height: 900,
        color: Colors.white,
        child: SingleChildScrollView(
          // Add SingleChildScrollView
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
                title: const Text('Formation'),
                onTap: () {
                  dropdownValue = 'Mes Formations';
                  Navigator.pop(context);
                  Navigator.push(
                    // Navigate to FormationScreen
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormationScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Deconnexion'),
                onTap: () {
                  // Handle logout button press
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserAccount extends StatelessWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: UserAccountsDrawerHeader(
        accountName: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 28.0),
              child: CircleAvatar(
                child: Icon(Icons.person),
                radius: 46,
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        accountEmail: Padding(
          padding: EdgeInsets.only(left: 100.0, bottom: 34),
          child: Text('john.doe@example.com'),
        ),
      ),
    );
  }
}

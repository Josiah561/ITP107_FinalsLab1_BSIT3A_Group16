import 'package:flutter/material.dart';
import '../main.dart';

// HOME SCREEN
// - Shows a welcome message using the name passed from Login/Sign Up.
// - Logout button -> goes back to Login (already wired up).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Grab the arguments passed via Navigator (e.g. {'name': 'Jane'})
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String name = (args?['name'] as String?)?.trim().isNotEmpty == true
        ? args!['name'] as String
        : 'there';
    void logoutPressed() {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -100,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    MyApp.neonGreen.withOpacity(0.35),
                    MyApp.neonGreen.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    MyApp.neonGreen.withOpacity(0.18),
                    MyApp.neonGreen.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          // ===== welcome content on top =====
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // small wordmark, same as login screen
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: MyApp.neonGreen.withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // pushes the welcome block to vertical center
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Welcome,',
                            style: TextStyle(
                              color: MyApp.greyText,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),

                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 8),
                          const Text(
                            "You're signed in.",
                            style: TextStyle(
                              color: MyApp.greyText,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: ElevatedButton(
                      onPressed: logoutPressed,
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

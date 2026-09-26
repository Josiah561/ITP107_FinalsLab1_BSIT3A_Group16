import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ===== COLOR THEME =====
  // use ONLY these colors in your screens
  static const Color bgColor = Color(0xFF0D0D0D);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color cardColor = Color(
    0xFF1A1A1A,
  ); // slightly lighter black for text fields/cards
  static const Color greyText = Color(0xFFAAAAAA); // subtitle/grey text

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Screen App',
      debugShowCheckedModeBanner: false,

      // Basic dark theme setup. If you want to change how buttons/fields
      // look GLOBALLY (for all 3 screens), edit it here instead of in
      // each screen file separately
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        brightness: Brightness.dark,

        // default style for every ElevatedButton in the app
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: neonGreen,
            foregroundColor: Colors.black,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        // default style for every TextField/TextFormField in the app
        // "glass" style: low-opacity white fill + white outline, rounded corners
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.06),
          labelStyle: const TextStyle(color: greyText, fontSize: 14),
          hintStyle: const TextStyle(color: Colors.white38),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.25)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.25)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: neonGreen, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1.4),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1.6),
          ),
          errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 11),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: neonGreen),
        ),
      ),

      // ===== NAMED ROUTES =====
      // initialRoute = which screen shows first when app opens.
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
      // NOTE: don't use MaterialPageRoute/Navigator.push with widgets
      // directly anywhere in the app. We're required to use named routes
      // (the ones declared above) + Navigator.pushNamed / pushReplacementNamed / pop.
    );
  }
}

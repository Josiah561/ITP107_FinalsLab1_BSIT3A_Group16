import 'package:flutter/material.dart';
import '../main.dart';

// SIGN UP SCREEN
// TODO:
// - This already works, just make sure it matches the Login screen's look
//   if you change anything (same colors from main.dart: MyApp.neonGreen etc).
// - Fields required: full name, email, password, confirm password.
// - "Login" link -> goes back to Login screen using Navigator.pop.
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUpPressed() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void goToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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

          // ===== actual sign up form on top =====
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // small wordmark
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
                      const SizedBox(height: 10),

                      const Text(
                        'Create account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Sign up to get started.',
                        style: TextStyle(color: MyApp.greyText, fontSize: 14),
                      ),
                      const SizedBox(height: 20),

                      // Full name field
                      TextFormField(
                        controller: fullNameController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Full name',
                          hintText: 'Dwight Ramos',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Email field
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'you@example.com',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Password field
                      TextFormField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: MyApp.greyText,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() => hidePassword = !hidePassword);
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Confirm password field
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: hideConfirmPassword,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              hideConfirmPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: MyApp.greyText,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(
                                () =>
                                    hideConfirmPassword = !hideConfirmPassword,
                              );
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 23),

                      ElevatedButton(
                        onPressed: signUpPressed,
                        child: const Text('Sign up'),
                      ),
                      const SizedBox(height: 14),

                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: MyApp.greyText,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: goToLogin,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: MyApp.neonGreen,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

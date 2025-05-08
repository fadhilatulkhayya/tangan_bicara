// screens/signup_screen.dart
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '← back to Login',
                    style: TextStyle(
                      color: Color(0xFFB1956B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB1956B),
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField(icon: Icons.person, hintText: 'Username'),
              const SizedBox(height: 16),
              _buildInputField(icon: Icons.lock, hintText: 'Password', obscure: true),
              const SizedBox(height: 16),
              _buildInputField(icon: Icons.lock, hintText: 'Confirm Password', obscure: true),
              const SizedBox(height: 24),
              CustomButton(
                label: 'Login',
                onPressed: () {
                  // aksi setelah signup
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required IconData icon,
    required String hintText,
    bool obscure = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(icon, color: Colors.grey[700]),
          hintText: hintText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const TanganBicaraApp());
}

class TanganBicaraApp extends StatelessWidget {
  const TanganBicaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TanganBicara',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

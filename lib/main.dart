import 'package:flutter/material.dart';
import 'package:tangan_bicara/screens/home_screen.dart';
import 'package:tangan_bicara/screens/login_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}


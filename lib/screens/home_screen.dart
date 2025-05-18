import 'package:flutter/material.dart';
import 'setting_screen.dart';
import 'quiz_screen.dart';
import 'camera_screen.dart';
import 'dictionary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentLanguage = 'id'; // 'id' untuk Indonesia, 'en' untuk Inggris

  final Map<String, Map<String, String>> translations = {
    'id': {
      'home': 'Beranda',
      'greeting': 'Hi Pengguna!',
      'subtitle': 'Selamat Pagi Dunia',
      'welcome': 'Selamat Datang!',
      'explore': 'Jelajahi Fitur Aplikasi',
      'features': 'Fitur',
      'camera': 'Kamera',
      'dictionary': 'Kamus',
      'quiz': 'Kuis',
    },
    'en': {
      'home': 'Home',
      'greeting': 'Hi User!',
      'subtitle': 'Good Morning World',
      'welcome': 'Welcome!',
      'explore': 'Explore App Features',
      'features': 'Features',
      'camera': 'Camera',
      'dictionary': 'Dictionary',
      'quiz': 'Quiz',
    },
  };

  void _changeLanguage(String lang) {
    setState(() {
      currentLanguage = lang;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.grey[200],
        selectedItemColor: const Color(0xFFB6935E),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo_tanganbicara.png',
                    width: 30,
                    height: 30,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        translations[currentLanguage]!['home']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.language, color: Colors.black),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Pilih Bahasa / Choose Language'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text('🇮🇩 Bahasa Indonesia'),
                                onTap: () => _changeLanguage('id'),
                              ),
                              ListTile(
                                title: const Text('🇺🇸 English'),
                                onTap: () => _changeLanguage('en'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Greeting
              Text(
                translations[currentLanguage]!['greeting']!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB6935E),
                ),
              ),
              Text(
                translations[currentLanguage]!['subtitle']!,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Welcome Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.brown.shade200),
                  color: Colors.brown[50],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.waving_hand_rounded, color: Color(0xFFB6935E)),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translations[currentLanguage]!['welcome']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFB6935E),
                          ),
                        ),
                        Text(
                          translations[currentLanguage]!['explore']!,
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Fitur section
              Text(
                translations[currentLanguage]!['features']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Feature Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureBox(
                    icon: Icons.camera_alt,
                    label: translations[currentLanguage]!['camera']!,
                    context: context,
                  ),
                  _buildFeatureBox(
                    icon: Icons.menu_book,
                    label: translations[currentLanguage]!['dictionary']!,
                    context: context,
                  ),
                  _buildFeatureBox(
                    icon: Icons.psychology,
                    label: translations[currentLanguage]!['quiz']!,
                    context: context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildFeatureBox({
    required IconData icon,
    required String label,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        if (label == "Quiz" || label == "Kuis") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizScreen()),
          );
        } else if (label == "Camera" || label == "Kamera") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CameraScreen()),
          );
        } else if (label == "Dictionary" || label == "Kamus") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const DictionaryScreen()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFB6935E),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  final List<Map<String, String>> signs = const [
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamus Isyarat'),
        backgroundColor: const Color(0xFFB6935E),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: signs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final sign = signs[index];
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEADBC8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        sign['image']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        sign['letter']!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

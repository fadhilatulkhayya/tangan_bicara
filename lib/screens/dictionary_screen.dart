import 'package:flutter/material.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  final List<Map<String, String>> signs = const [
    {'image': 'assets/signs/a.jpg', 'letter': 'A'},
    {'image': 'assets/signs/b.jpg', 'letter': 'B'},
    {'image': 'assets/signs/c.jpg', 'letter': 'C'},
    {'image': 'assets/signs/d.jpg', 'letter': 'D'},
    {'image': 'assets/signs/e.jpg', 'letter': 'E'},
    {'image': 'assets/signs/f.jpg', 'letter': 'F'},
    {'image': 'assets/signs/g.jpg', 'letter': 'G'},
    {'image': 'assets/signs/h.jpg', 'letter': 'H'},
    {'image': 'assets/signs/i.jpg', 'letter': 'I'},
    {'image': 'assets/signs/j.jpg', 'letter': 'J'},
    {'image': 'assets/signs/k.jpg', 'letter': 'K'},
    {'image': 'assets/signs/l.jpg', 'letter': 'L'},
    {'image': 'assets/signs/m.jpg', 'letter': 'M'},
    {'image': 'assets/signs/n.jpg', 'letter': 'N'},
    {'image': 'assets/signs/o.jpg', 'letter': 'O'},
    {'image': 'assets/signs/p.jpg', 'letter': 'P'},
    {'image': 'assets/signs/q.jpg', 'letter': 'Q'},
    {'image': 'assets/signs/r.jpg', 'letter': 'R'},
    {'image': 'assets/signs/s.jpg', 'letter': 'S'},
    {'image': 'assets/signs/t.jpg', 'letter': 'T'},
    {'image': 'assets/signs/u.jpg', 'letter': 'U'},
    {'image': 'assets/signs/v.jpg', 'letter': 'V'},
    {'image': 'assets/signs/w.jpg', 'letter': 'W'},
    {'image': 'assets/signs/x.jpg', 'letter': 'X'},
    {'image': 'assets/signs/y.jpg', 'letter': 'Y'},
    {'image': 'assets/signs/z.jpg', 'letter': 'Z'},
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
                      child: Image.asset(sign['image']!, fit: BoxFit.contain),
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

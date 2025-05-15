import 'package:flutter/material.dart';
import '../widgets/sign_card.dart';

class SignLanguageScreen extends StatelessWidget {
  final List<Map<String, String>> signs = [
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.brown),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              border: InputBorder.none,
              hintText: "search",
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: signs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return SignCard(
              imagePath: 'assets/signs/${signs[index]['image']}',
              letter: signs[index]['letter']!,
            );
          },
        ),
      ),
    );
  }
}

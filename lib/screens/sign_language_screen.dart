import 'package:flutter/material.dart';
import '../widgets/sign_card.dart';

class SignLanguageScreen extends StatelessWidget {
  final List<Map<String, String>> signs = [
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

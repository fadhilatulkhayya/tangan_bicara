import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool showOverlay = false;
  bool isCorrect = false;

  final List<Map<String, dynamic>> questions = [
    {
      'image': 'assets/signs/c.jpg',
      'answer': 'C',
      'options': ['B', 'A', 'C'],
    },
    {
      'image': 'assets/signs/b.jpg',
      'answer': 'B',
      'options': ['D', 'C', 'B'],
    },
    {
      'image': 'assets/signs/j.jpg',
      'answer': 'J',
      'options': ['C', 'J', 'W'],
    },
    {
      'image': 'assets/signs/d.jpg',
      'answer': 'D',
      'options': ['N', 'F', 'D'],
    },
    {
      'image': 'assets/signs/e.jpg',
      'answer': 'E',
      'options': ['E', 'B', 'D'],
    },
    {
      'image': 'assets/signs/m.jpg',
      'answer': 'M',
      'options': ['M', 'Q', 'F'],
    },
    {
      'image': 'assets/signs/g.jpg',
      'answer': 'G',
      'options': ['G', 'D', 'K'],
    },
    {
      'image': 'assets/signs/r.jpg',
      'answer': 'R',
      'options': ['R', 'P', 'H'],
    },
    {
      'image': 'assets/signs/i.jpg',
      'answer': 'I',
      'options': ['O', 'I', 'K'],
    },
    {
      'image': 'assets/signs/s.jpg',
      'answer': 'S',
      'options': ['T', 'S', 'j'],
    },
    {
      'image': 'assets/signs/k.jpg',
      'answer': 'K',
      'options': ['Y', 'K', 'E'],
    },
    {
      'image': 'assets/signs/w.jpg',
      'answer': 'W',
      'options': ['L', 'B', 'W'],
    },
    {
      'image': 'assets/signs/t.jpg',
      'answer': 'T',
      'options': ['T', 'N', 'M'],
    },
    {
      'image': 'assets/signs/n.jpg',
      'answer': 'N',
      'options': ['N', 'Z', 'S'],
    },
    {
      'image': 'assets/signs/p.jpg',
      'answer': 'P',
      'options': ['P', 'O', 'G'],
    },
    {
      'image': 'assets/signs/a.jpg',
      'answer': 'A',
      'options': ['P', 'A', 'D'],
    },
    {
      'image': 'assets/signs/q.jpg',
      'answer': 'Q',
      'options': ['H', 'V', 'Q'],
    },
    {
      'image': 'assets/signs/z.jpg',
      'answer': 'Z',
      'options': ['R', 'M', 'Z'],
    },
    {
      'image': 'assets/signs/v.jpg',
      'answer': 'V',
      'options': ['V', 'F', 'S'],
    },
    {
      'image': 'assets/signs/l.jpg',
      'answer': 'L',
      'options': ['C', 'T', 'L'],
    },
    {
      'image': 'assets/signs/e.jpg',
      'answer': 'E',
      'options': ['U', 'H', 'E'],
    },
    {
      'image': 'assets/signs/v.jpg',
      'answer': 'V',
      'options': ['C', 'A', 'V'],
    },
    {
      'image': 'assets/signs/w.jpg',
      'answer': 'W',
      'options': ['H', 'B', 'W'],
    },
    {
      'image': 'assets/signs/x.jpg',
      'answer': 'X',
      'options': ['X', 'C', 'O'],
    },
    {
      'image': 'assets/signs/y.jpg',
      'answer': 'Y',
      'options': ['R', 'Y', 'Z'],
    },
    {
      'image': 'assets/signs/f.jpg',
      'answer': 'F',
      'options': ['Z', 'F', 'D'],
    },
  ];

  void checkAnswer(String selectedAnswer) {
    final currentQuestion = questions[currentQuestionIndex];
    isCorrect = selectedAnswer == currentQuestion['answer'];

    setState(() {
      showOverlay = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (isCorrect) score++;

      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          showOverlay = false;
        });
      } else {
        setState(() => showOverlay = false);
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text("Selesai!"),
                content: Text("Skor kamu: $score dari ${questions.length}"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        currentQuestionIndex = 0;
                        score = 0;
                        showOverlay = false;
                      });
                    },
                    child: const Text("Main lagi"),
                  ),
                ],
              ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'Tebak Tangan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB08968),
                ),
              ),
              const SizedBox(height: 24),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      currentQuestion['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Overlay for correct/incorrect feedback
                  if (showOverlay)
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color:
                            isCorrect
                                ? Colors.green.withOpacity(0.7)
                                : Colors.red.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(
                          isCorrect ? Icons.check : Icons.close,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              ...currentQuestion['options'].map<Widget>((option) {
                return Column(
                  children: [
                    _buildOptionButton(option),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(String label) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () => checkAnswer(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB08968),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

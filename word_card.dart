import 'package:flutter/material.dart';
import '../models/word_model.dart';

class WordCard extends StatelessWidget {
  final WordModel word;
  final VoidCallback onRightPressed;
  final VoidCallback onWrongPressed;

  const WordCard({
    super.key,
    required this.word,
    required this.onRightPressed,
    required this.onWrongPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(word.imagePath, height: 200),
        SizedBox(height: 20),
        Text(
          word.kannada,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: onWrongPressed,
              icon: Icon(Icons.close, color: Colors.red, size: 50),
            ),
            IconButton(
              onPressed: onRightPressed,
              icon: Icon(Icons.check, color: Colors.green, size: 50),
            ),
          ],
        ),
      ],
    );
  }
}

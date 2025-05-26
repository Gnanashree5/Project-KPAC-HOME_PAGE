import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/sentence_screen.dart'
    as sentence_screen;
import 'package:flutter_application_1/data/ka_words.dart'; // adjust if needed
import 'package:flutter_application_1/models/word_model.dart';
import 'package:flutter_application_1/widgets/reinforcement_animation.dart';

class KaModuleScreen extends StatefulWidget {
  const KaModuleScreen({super.key});

  @override
  State<KaModuleScreen> createState() => _KaModuleScreenState();
}

class _KaModuleScreenState extends State<KaModuleScreen> {
  int currentIndex = 0;

  void _showReinforcement(String type) {
    showDialog(
      context: context,
      builder: (context) => ReinforcementAnimation(type: type),
    );
  }

  void _nextWord() {
    if (currentIndex < kaWords.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => sentence_screen.SentenceScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    WordModel word = kaWords[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('KA Module'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(word.imagePath, fit: BoxFit.contain, height: 250),
                  const SizedBox(height: 20),
                  Text(
                    word.kannada,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    word.english,
                    style: const TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.check, color: Colors.green),
                  label: const Text('Correct'),
                  onPressed: () => _showReinforcement('right'),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.close, color: Colors.red),
                  label: const Text('Wrong'),
                  onPressed: () => _showReinforcement('wrong'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _nextWord, child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}

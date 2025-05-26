import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/reinforcement_animation.dart';
import 'package:flutter_application_1/screens/story_screen.dart';

class SentenceScreen extends StatelessWidget {
  const SentenceScreen({super.key});

  void _showReinforcement(BuildContext context, String type) {
    showDialog(
      context: context,
      builder: (context) => ReinforcementAnimation(type: type),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sentence Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/kaage.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              'ಆಕಾಶದಲ್ಲಿ ಕಾಗೆ ಹಾರುತ್ತಿದೆ.​. (A crow is flying in the sky)',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showReinforcement(context, 'right'),
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text("Correct"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _showReinforcement(context, 'wrong'),
                  icon: const Icon(Icons.close, color: Colors.white),
                  label: const Text("Wrong"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoriesScreen(),
                  ),
                );
              },
              child: const Text("Next →"),
            ),
          ],
        ),
      ),
    );
  }
}

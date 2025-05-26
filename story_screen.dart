import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/reinforcement_animation.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> stories = [
    {
      "image": "lib/assets/images/story1.webp",
      "sentence1": "ಮನೆಯವರು ಸಂತೆಗೆ ಹೋದರು.",
      "sentence2": "The family went to the market.",
    },
    {
      "image": "lib/assets/images/story2.jpg",
      "sentence1": "ಮಗು ಶಾಲೆಗೆ ಹೋಗುತ್ತಿದೆ.",
      "sentence2": "The child is going to school.",
    },
    // Add more stories as needed
  ];

  void _showReinforcement(String type) {
    showDialog(
      context: context,
      builder: (_) => ReinforcementAnimation(type: type),
    );
  }

  void _nextStory() {
    setState(() {
      if (currentIndex < stories.length - 1) {
        currentIndex++;
      }
    });
  }

  void _previousStory() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final story = stories[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Story Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                story['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              story['sentence1']!,
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              story['sentence2']!,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showReinforcement('right'),
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text("Correct"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _showReinforcement('wrong'),
                  icon: const Icon(Icons.close, color: Colors.white),
                  label: const Text("Wrong"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousStory,
                  child: const Text("← Previous"),
                ),
                ElevatedButton(
                  onPressed: _nextStory,
                  child: const Text("Next →"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReinforcementAnimation extends StatelessWidget {
  final String type; // 'right' or 'wrong'

  const ReinforcementAnimation({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    String animationPath =
        type == 'right'
            ? 'lib/assets/animations/right.json'
            : 'lib/assets/animations/wrong.json';

    return AlertDialog(content: Lottie.asset(animationPath, repeat: false));
  }
}

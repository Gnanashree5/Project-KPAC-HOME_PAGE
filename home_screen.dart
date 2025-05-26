import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ka_module_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KPAC Home'),
        centerTitle: true, // Center the title in AppBar (optional)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/ka.webp',
                width: 200, // optional size
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  debugPrint("Navigating to KA Module");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KaModuleScreen()),
                  );
                },
                child: Text("Start KA Module", style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

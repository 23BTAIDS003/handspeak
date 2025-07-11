import 'package:flutter/material.dart';

class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> greetings = [
      {'text': 'Hello', 'image': 'assets/greetings/hello.gif'},
      {'text': 'Good Morning', 'image': 'assets/greetings/good_morning.gif'},
      {'text': 'Thank You', 'image': 'assets/greetings/thank_you.gif'},
      {'text': 'Please', 'image': 'assets/greetings/please.gif'},
      {'text': 'Sorry', 'image': 'assets/greetings/sorry.gif'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Greetings"),
        backgroundColor: const Color(0xFF8B5CF6),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: greetings.length,
        itemBuilder: (context, index) {
          final greeting = greetings[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  greeting['image']!,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                greeting['text']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> phrases = [
      {'text': 'How are you?', 'image': 'assets/phrases/how_are_you.gif'},
      {'text': 'What is your name?', 'image': 'assets/phrases/what_is_your_name.gif'},
      {'text': 'Nice to meet you', 'image': 'assets/phrases/nice_to_meet_you.gif'},
      {'text': 'Can you help me?', 'image': 'assets/phrases/can_you_help_me.gif'}, // ✅ NEW
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Phrases"),
        backgroundColor: const Color(0xFF8B5CF6),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          final phrase = phrases[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: const Color(0xFF8B5CF6).withOpacity(0.2),
                child: ClipOval(
                  child: Image.asset(
                    phrase['image']!,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                phrase['text']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}

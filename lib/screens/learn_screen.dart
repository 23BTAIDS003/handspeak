import 'package:flutter/material.dart';
import '../widgets/gesture_card.dart'; // Updated GestureCard

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'name': 'Alphabet', 'icon': Icons.abc, 'route': '/alphabet'},
      {'name': 'Numbers', 'icon': Icons.numbers, 'route': '/numbers'},
      {'name': 'Greetings', 'icon': Icons.waving_hand, 'route': '/greetings'},
      {'name': 'Common Phrases', 'icon': Icons.chat_bubble_outline, 'route': '/phrases'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 📚 Categories Grid
              Text(
                "Categories",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return GestureCard(
                    title: item['name'],
                    icon: item['icon'],
                    onTap: () {
                      Navigator.pushNamed(context, item['route']);
                    },
                  );
                },
              ),
              const SizedBox(height: 32),


            ],
          ),
        ),
      ),
    );
  }
}

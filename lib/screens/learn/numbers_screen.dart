import 'package:flutter/material.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> numbers = List.generate(10, (index) => {
      'text': index.toString(),
      'image': 'assets/numbers/$index.png',
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Numbers"),
        backgroundColor: const Color(0xFF8B5CF6),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          final number = numbers[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFF8B5CF6).withOpacity(0.2),
                  backgroundImage: AssetImage(number['image']!),
                ),
                const SizedBox(height: 8),
                Text(
                  number['text']!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

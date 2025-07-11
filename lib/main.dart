import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:handspeak/screens/splash_screen.dart';
import 'package:handspeak/screens/login_screen.dart';
import 'package:handspeak/screens/signup_screen.dart';
import 'package:handspeak/screens/home_screen.dart';

// ✅ Import the Learn Screens from subfolder
import 'package:handspeak/screens/learn/alphabet_screen.dart';
import 'package:handspeak/screens/learn/numbers_screen.dart';
import 'package:handspeak/screens/learn/greetings_screen.dart';
import 'package:handspeak/screens/learn/phrases_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC9wFAZNmBKgQIolYewKCaEQTShxjDrz6s",
        authDomain: "handspeak-app.firebaseapp.com",
        projectId: "handspeak-app",
        storageBucket: "handspeak-app.appspot.com",
        messagingSenderId: "855981092769",
        appId: "1:855981092769:web:275e82a241eca16af0a5e0",
      ),
    );
  } else {
    await Firebase.initializeApp(); // Uses google-services.json for Android/iOS
  }

  runApp(const HandSpeakApp());
}

class HandSpeakApp extends StatelessWidget {
  const HandSpeakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HandSpeak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/alphabet': (context) => const AlphabetScreen(),
        '/numbers': (context) => const NumbersScreen(),
        '/greetings': (context) => const GreetingsScreen(),
        '/phrases': (context) => const PhrasesScreen(),
      },
    );
  }
}

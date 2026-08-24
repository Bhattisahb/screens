import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/quote_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuvva Clone UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7FA), // Light gray background
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B43ED), // Primary purple
          primary: const Color(0xFF6B43ED),
          onPrimary: Colors.white,
          secondary: const Color(0xFFEBE6FE), // Light purple for secondary buttons
          onSecondary: const Color(0xFF6B43ED),
          background: const Color(0xFFF7F7FA),
        ),
        fontFamily: 'Roboto', // Ideally Inter or similar, but Roboto is default
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Color(0xFF10133A), fontWeight: FontWeight.bold),
          displayMedium: TextStyle(color: Color(0xFF10133A), fontWeight: FontWeight.bold),
          displaySmall: TextStyle(color: Color(0xFF10133A), fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Color(0xFF10133A), fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(color: Color(0xFF10133A), fontWeight: FontWeight.bold),
          titleLarge: TextStyle(color: Color(0xFF10133A), fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Color(0xFF10133A)),
          bodyMedium: TextStyle(color: Color(0xFF5A5C77)), // Subtitle text color
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/quote': (context) => const QuoteScreen(),
      },
    );
  }
}

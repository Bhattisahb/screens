import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/search_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const PlacesApp());
}

class PlacesApp extends StatelessWidget {
  const PlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4C6A5A),
          background: const Color(0xFFEFEDE6), // Off-white cream
          surface: const Color(0xFFEFEDE6),
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: const Color(0xFF222222),
          displayColor: const Color(0xFF222222),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/search': (context) => const SearchScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}

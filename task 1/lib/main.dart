import 'package:flutter/material.dart';
import 'main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash App Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Light gray background
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main layout after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainLayout()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // The splash screen has a bright green background
    return Scaffold(
      backgroundColor: const Color(0xFF00D632), 
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              '\$',
              style: TextStyle(
                color: Color(0xFF00D632),
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cash App Splash',
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The specific Cash App bright green color
    const Color cashAppGreen = Color(0xFF00D632);

    return Scaffold(
      // 1. Scaffold background color sets the entire screen to green
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Husnain App'),
      ),

      // 2. Center widget ensures the logo is exactly in the middle of the screen
      body: Center(
        // 3. Container acts as the black box for the logo
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
            // 4. BorderRadius gives the container rounded corners
            borderRadius: BorderRadius.circular(1),
          ),
          // 5. Another Center widget to put the dollar sign in the middle of the black box
          child: Center(
            child: Text(
              '\$',
              style: TextStyle(
                // 6. The dollar sign color matches the background green
                color: Colors.yellow,
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

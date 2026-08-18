import 'package:flutter/material.dart';
void main(){
  runApp(const BhattiApp());
}

class BhattiApp extends StatelessWidget {
  const BhattiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Bhatti();
  }
}

class Bhatti extends StatefulWidget {
  const Bhatti({super.key});

  @override
  State<Bhatti> createState() => _BhattiState();
}

class _BhattiState extends State<Bhatti> {
  @override
  Widget build(BuildContext context) {
    const Color green=Color(0xFF00D632);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: green,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
                borderRadius: BorderRadius.circular(30)
          ),
          height: 100,
          width: 100,

          child: Center(
            child: Text('\$',style: TextStyle(
                color: green,
              fontWeight: FontWeight.bold,
              fontSize: 50,
              fontStyle: FontStyle.italic
            ),),
          ),
        ),
      ),
      ),
    );
  }
}


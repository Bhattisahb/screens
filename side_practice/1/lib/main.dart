import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CashApp(),
    );
  }
}
class CashApp extends StatefulWidget {
  const CashApp({super.key});

  @override
  State<CashApp> createState() => _CashAppState();
}

class _CashAppState extends State<CashApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money' ,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold

        ),

        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        leading: [

        ],
      ),

    );
  }
}


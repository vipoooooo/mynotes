import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: TextButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.black),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.lime)),
          onPressed: () {},
          child: const Text("Register"),
        ),
      ),
    );
  }
}

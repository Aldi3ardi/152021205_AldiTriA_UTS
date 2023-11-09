import 'package:buat/dashboard.dart';
import 'package:flutter/material.dart';
import 'splash.dart'; // Import file splash.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(), // Menggunakan SplashPage sebagai halaman awal
    );
  }
}

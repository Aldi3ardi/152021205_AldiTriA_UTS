import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart'; // Import file login.dart

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Tambahkan penundaan sementara untuk simulasi splash screen
    Timer(Duration(seconds: 2), () {
      // Navigasi ke halaman login setelah selesai splash screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tambahkan gambar logo atau elemen tampilan lain di sini
            Image.asset('images/aldi.png', width: 150, height: 150), // Ganti dengan path gambar yang sesuai
            SizedBox(height: 16.0),
            Text(
              'Apps',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

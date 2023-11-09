import 'package:flutter/material.dart';
import 'login.dart';
import 'kalkulator.dart';
import 'about.dart';
import 'bmi.dart';
import 'currency.dart';
import 'nilai.dart';
import 'suhu.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/profil.jpeg'),
                    // Isi dengan gambar profil pengguna jika diperlukan
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            buildListTile(Icons.calculate, 'Kalkulator', KalkulatorPage(), context),
            buildListTile(Icons.info, 'About', AboutPage(), context),
            buildListTile(Icons.calculate, 'BMI', BmiPage(), context),
            buildListTile(Icons.calculate, 'Currency', CurrencyConverterPage(), context),
            buildListTile(Icons.calculate, 'Nilai', NilaiPage(), context),
            buildListTile(Icons.calculate, 'Suhu', SuhuConverterPage(), context),
            buildListTile(Icons.exit_to_app, 'Logout', LoginPage(), context),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat datang di Dashboard!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(IconData icon, String title, Widget page, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

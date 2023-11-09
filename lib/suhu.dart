import 'package:buat/dashboard.dart';
import 'package:buat/nilai.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'kalkulator.dart';
import 'about.dart';
import 'bmi.dart';
import 'currency.dart';

class SuhuConverterPage extends StatefulWidget {
  @override
  _SuhuConverterPageState createState() => _SuhuConverterPageState();
}

class _SuhuConverterPageState extends State<SuhuConverterPage> {
  double inputSuhu = 0.0;
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  double convertedSuhu = 0.0;

  // Fungsi untuk mengkonversi suhu
  void convertSuhu() {
    if (fromUnit == 'Celsius' && toUnit == 'Fahrenheit') {
      convertedSuhu = (inputSuhu * 9 / 5) + 32;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Celsius') {
      convertedSuhu = (inputSuhu - 32) * 5 / 9;
    } else if (fromUnit == 'Celsius' && toUnit == 'Kelvin') {
      convertedSuhu = inputSuhu + 273.15;
    } else if (fromUnit == 'Kelvin' && toUnit == 'Celsius') {
      convertedSuhu = inputSuhu - 273.15;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Kelvin') {
      convertedSuhu = (inputSuhu - 32) * 5 / 9 + 273.15;
    } else if (fromUnit == 'Kelvin' && toUnit == 'Fahrenheit') {
      convertedSuhu = (inputSuhu - 273.15) * 9 / 5 + 32;
    } else {
      // Konversi unit yang sama
      convertedSuhu = inputSuhu;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suhu Converter'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // Warna latar belakang sisi navigasi
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
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Beranda'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate), // Icon kalkulator
                title: Text('Kalkulator'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KalkulatorPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate), // Icon suhu
                title: Text('Nilai'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NilaiPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate), // Icon BMI
                title: Text('BMI'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate), // Icon Currency
                title: Text('Currency'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurrencyConverterPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info), // Icon about
                title: Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Masukkan suhu:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                inputSuhu = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Konversi dari:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: fromUnit,
              onChanged: (value) {
                setState(() {
                  fromUnit = value!;
                });
              },
              items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Konversi ke:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: toUnit,
              onChanged: (value) {
                setState(() {
                  toUnit = value!;
                });
              },
              items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                convertSuhu();
              },
              child: Text('Konversi Suhu'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Hasil Konversi: ${convertedSuhu.toStringAsFixed(2)} $toUnit',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

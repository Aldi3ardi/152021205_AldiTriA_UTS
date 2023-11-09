import 'package:buat/dashboard.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'kalkulator.dart';
import 'about.dart';
import 'bmi.dart';
import 'currency.dart';
import 'suhu.dart'; // Import file suhu.dart

class NilaiPage extends StatefulWidget {
  @override
  _NilaiPageState createState() => _NilaiPageState();
}

class _NilaiPageState extends State<NilaiPage> {
  double tugas1 = 0.0;
  double tugas2 = 0.0;
  double uts = 0.0;
  double uas = 0.0;
  double nilaiAkhir = 0.0;
  String grade = '';

  void hitungNilaiAkhir() {
    // Bobot nilai
    double bobotTugas1 = 0.2;
    double bobotTugas2 = 0.2;
    double bobotUTS = 0.3;
    double bobotUAS = 0.3;

    // Hitung nilai akhir
    nilaiAkhir = (tugas1 * bobotTugas1) +
        (tugas2 * bobotTugas2) +
        (uts * bobotUTS) +
        (uas * bobotUAS);

    // Tentukan grade berdasarkan nilai akhir
    if (nilaiAkhir >= 80) {
      grade = 'A';
    } else if (nilaiAkhir >= 70) {
      grade = 'B';
    } else if (nilaiAkhir >= 60) {
      grade = 'C';
    } else if (nilaiAkhir >= 50) {
      grade = 'D';
    } else {
      grade = 'E';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Nilai Akhir'),
        backgroundColor: Colors.blue,
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
                  // Tambahkan logika untuk menavigasi ke beranda di sini
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
                title: Text('Suhu'), // Ubah label menu menjadi 'Suhu'
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuhuConverterPage(), // Gunakan SuhuConverterPage
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
      body: Container(
        color: Colors.white, // Warna latar belakang halaman
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tugas 1:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tugas1 = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 10.0),
              Text(
                'Tugas 2:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tugas2 = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 10.0),
              Text(
                'UTS:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  uts = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 10.0),
              Text(
                'UAS:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  uas = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  hitungNilaiAkhir();
                },
                child: Text('Hitung Nilai Akhir'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Warna tombol
                  onPrimary: Colors.white, // Warna teks
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bentuk tombol
                  ),
                  elevation: 5, // Efek bayangan
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Nilai Akhir: ${nilaiAkhir.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Grade: $grade',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

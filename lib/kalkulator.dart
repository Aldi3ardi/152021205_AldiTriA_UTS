import 'package:buat/nilai.dart';
import 'package:buat/suhu.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'login.dart';
import 'about.dart';
import 'bmi.dart';
import 'currency.dart';

class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String input = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';
  String result = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      input = '';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
      result = '';
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      num1 = double.parse(input);
      operand = buttonText;
      input = '';
    } else if (buttonText == '=') {
      num2 = double.parse(input);
      if (operand == '+') {
        result = (num1 + num2).toString();
      }
      if (operand == '-') {
        result = (num1 - num2).toString();
      }
      if (operand == '*') {
        result = (num1 * num2).toString();
      }
      if (operand == '/') {
        result = (num1 / num2).toString();
      }
    } else {
      input += buttonText;
    }

    setState(() {
      input = input;
      result = result;
    });
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          buttonPressed(buttonText);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
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
              leading: Icon(Icons.calculate),
              title: Text('currency'),
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
              leading: Icon(Icons.calculate),
              title: Text('Suhu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuhuConverterPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
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
              leading: Icon(Icons.info),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerRight,
            child: Container( // Kontainer untuk input
              width: 400, // Lebar kontainer
              height: 200, // Tinggi kontainer
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                input,
                style: TextStyle(fontSize: 36.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('7', Colors.blue),
              buildButton('8', Colors.blue),
              buildButton('9', Colors.blue),
              buildButton('/', Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('4', Colors.blue),
              buildButton('5', Colors.blue),
              buildButton('6', Colors.blue),
              buildButton('*', Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('1', Colors.blue),
              buildButton('2', Colors.blue),
              buildButton('3', Colors.blue),
              buildButton('-', Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('0', Colors.blue),
              buildButton('C', Colors.red),
              buildButton('=', Colors.orange),
              buildButton('+', Colors.orange),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerRight,
            child: Container( // Kontainer untuk hasil
              width: 400, // Lebar kontainer
              height: 100, // Tinggi kontainer
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                result,
                style: TextStyle(fontSize: 36.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

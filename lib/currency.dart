import 'package:buat/nilai.dart';
import 'package:buat/suhu.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'login.dart';
import 'about.dart';
import 'kalkulator.dart';
import 'bmi.dart';
import 'currency.dart';

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double amount = 0.0;
  String fromCurrency = 'USD';
  String toCurrency = 'USD'; // Default target currency
  double convertedAmount = 0.0;

  final Map<String, Map<String, double>>? currencyConversionRates = {
    'USD': {'USD': 1.0, 'EUR': 0.85, 'GBP': 0.73, 'JPY': 110.33, 'IDR': 14000.0},
    'EUR': {'USD': 1.18, 'EUR': 1.0, 'GBP': 0.87, 'JPY': 130.62, 'IDR': 16548.0},
    'GBP': {'USD': 1.37, 'EUR': 1.15, 'GBP': 1.0, 'JPY': 150.37, 'IDR': 19059.0},
    'JPY': {'USD': 0.0091, 'EUR': 0.0077, 'GBP': 0.0067, 'JPY': 1.0, 'IDR': 127.07},
    'IDR': {'USD': 0.0000714, 'EUR': 0.0000604, 'GBP': 0.0000524, 'JPY': 0.0079, 'IDR': 1.0},
  };

  void convertCurrency() {
    final Map<String, double>? fromCurrencyMap = currencyConversionRates?[fromCurrency];
    if (fromCurrencyMap != null) {
      final double? conversionRate = fromCurrencyMap[toCurrency];
      if (conversionRate != null) {
        convertedAmount = amount * conversionRate;
        setState(() {});
      } else {
        // Handle error if the target currency is not found
        // For example, display an error message or set a default value
      }
    } else {
      // Handle error if the source currency is not found
      // For example, display an error message or set a default value
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Currency Converter'),
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
              title: Text('Home'),
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
              leading: Icon(Icons.calculate), // Calculator icon
              title: Text('Calculator'),
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
              leading: Icon(Icons.info), // About icon
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
              leading: Icon(Icons.calculate), // Currency icon
              title: Text('Currency'),
              onTap: () {
                // No changes needed for the Currency Converter page
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate), // BMI icon
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Add border radius
                color: Colors.white, // Background color of the container
              ),
              child: Card(
                elevation: 5, // Add elevation for the card
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Enter amount:',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          amount = double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Convert from:',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      DropdownButton<String>(
                        value: fromCurrency,
                        onChanged: (value) {
                          setState(() {
                            fromCurrency = value!;
                          });
                        },
                        items: currencyConversionRates?.keys.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList() ?? [],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Convert to:',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      DropdownButton<String>(
                        value: toCurrency,
                        onChanged: (value) {
                          setState(() {
                            toCurrency = value!;
                          });
                        },
                        items: currencyConversionRates?.keys.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList() ?? [],
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          convertCurrency();
                        },
                        child: Text('Convert'),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Converted amount: $convertedAmount $toCurrency',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

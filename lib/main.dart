import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Convertor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.red,
        hintColor: Colors.grey,
      ),
      home: const CurrencyConvertor(),
    );
  }
}

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key});
  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {
  // Global Variables
  //TextEditingController inputValue = TextEditingController(); // global variable
  double inputValue = 0;
  String? errorText;
  String? currency = 'RON';
  String? convertText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Currency Convertor',
          style: TextStyle(color: Colors.yellowAccent),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://www.meme-arsenal.com/memes/8b5853d172e50f14ec7c53af8975c449.jpg',
              ),
              const Text(
                'PUT YOUR MONEY HERE',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                //controller: inputValue,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'Enter the amount of EURO.',
                  hintStyle: const TextStyle(fontSize: 20),
                  errorText: errorText,
                  errorStyle: const TextStyle(fontSize: 20),
                  //labelText: 'Currency Convertor: EURO > RON',
                  //labelStyle: const TextStyle(fontSize: 30),
                ),
                onChanged: (String input) {
                  setState(() {
                    final double? value = double.tryParse(input);
                    if (value == null) {
                      errorText = 'Please enter a number.';
                    } else {
                      inputValue = value * 4.5;
                    }
                  });
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                icon: const Icon(Icons.currency_exchange_sharp, size: 30),
                label: const Text('Convert', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(300, 60),
                ),
                onPressed: () {
                  setState(() {
                    convertText = '$inputValue $currency';
                  });
                },
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text(
                  convertText!,
                  style: const TextStyle(color: Colors.grey, fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

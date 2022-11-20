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
          hintColor: Colors.grey),
      home: const CurrencyConvertor(title: 'Currency Convertor'),
    );
  }
}

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key, required this.title});
  final String title;
  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {
  TextEditingController inputValue = TextEditingController(); // global variable
  String currency = 'RON';
  void convert() {
    setState(() {});
  }

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
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    'https://www.meme-arsenal.com/memes/8b5853d172e50f14ec7c53af8975c449.jpg'),
                const Text("PUT YOUR MONEY HERE",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: inputValue,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                        //errorText: error,
                        hintText: 'Enter the amount of EURO',
                        labelStyle:
                            TextStyle(fontSize: 30, color: Colors.grey)),
                    onChanged: (String value) {
                      setState(() {
                        inputValue.text;
                      });
                    }),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.currency_exchange_sharp,
                    size: 30,
                  ),
                  label: const Text(
                    'Convert',
                    style: TextStyle(fontSize: 30),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      minimumSize: const Size(300, 60)),
                  onPressed: () {
                    Text('${inputValue.text} $currency');
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '${inputValue.text} $currency',
                  style: const TextStyle(color: Colors.grey, fontSize: 30),
                ),
              ],
            ),
          ),
        ));
  }
}

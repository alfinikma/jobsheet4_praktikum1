import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin","Reamur","Fahrenheit"];
  String selectedDropdown = "Kelvin";
  double hasilPerhitungan = 0.0;
 

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: etInput,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Celcius',
                hintText: 'Enter the temperature in celcius',
              ),
            ),
            SizedBox(height: 8),
            DropdownButton(
              isExpanded: true,
              value : selectedDropdown,
              items: listSatuanSuhu.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value){
                onDropdownChanged(value);
              },
              ),
              SizedBox(height: 10),
              Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
                ),
              Text(
                "$hasilPerhitungan",
                style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: 10),
                
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        konversiSuhu();
                      }, 
                      child: Text("Konversi Suhu"),
                      ),
                  ),
                ],
              ),                
        ],
        ),
      )      
    );
  }

  void konversiSuhu() {
    return setState(() {
                        if (etInput.text.isNotEmpty){
                          hasilPerhitungan = int.parse(etInput.text)*2;
                          switch (selectedDropdown) {
                            case "Kelvin":
                              hasilPerhitungan = int.parse(etInput.text)+273.15;
                              break;
                            case "Reamur":
                              hasilPerhitungan = int.parse(etInput.text)*4/5;
                              break;
                            case "Fahrenheit":
                              hasilPerhitungan = int.parse(etInput.text) * 9 / 5 + 32;
                              break;                      
                          }
                        }                        
                      });
  }

  void onDropdownChanged(Object? value) {
    return setState(() {
                selectedDropdown = value.toString();
              });
  }
}

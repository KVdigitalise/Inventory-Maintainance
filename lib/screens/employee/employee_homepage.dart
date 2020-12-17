import 'package:flutter/material.dart';
import './scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MaterialApp(title: 'employee app', home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;
  final tabs = [
    Center(child: Text('Home')),
    Scanner(),
    QrImage(
      data: "0",
      size: 100,
    )
  ];

  Future scanBarcode() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#fff666", "Cancel", true, ScanMode.QR)
        .then((value) => {
              print(value),
              setState(() {
                _currentindex = int.parse(value);
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi Vedant !"),
      ),
      body: tabs[_currentindex],
      floatingActionButton: FloatingActionButton(
        onPressed: scanBarcode,
        child: Icon(Icons.camera),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("home"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text("Camera"),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../employee/scanner.dart';
import '../employee/generate.dart';

class EmployeeHomePage extends StatefulWidget {
  @override
  _EmployeeHomePageState createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
  int _currentindex = 0;
  final tabs = [
    Center(child: Text('Home')),
    Generate(),
    Scanner(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Panel"),
      ),
      body: tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: "Camera",
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

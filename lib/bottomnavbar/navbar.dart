import 'package:flutter/material.dart';
import 'package:solar_system/system/aboutus.dart';
import 'package:solar_system/timeline/home.dart';
import 'package:solar_system/system/services.dart';
import 'package:solar_system/system/system.dart';
import 'package:solar_system/weather/weather.dart';
import 'package:solar_system/system/inquiries.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPackage(),
    );
  }
}

class MyPackage extends StatefulWidget {
  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  int currentIndex = 0;

  final _pageOption = [
    Home(),
    System(),
    Inquiries(),
    Services(),
    Weather(),
    Aboutus(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[currentIndex],
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'images/solarhouse.png',
            height: 105,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            // ignore: deprecated_member_use
            title: Text('System'),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_rounded),
            // ignore: deprecated_member_use
            title: Text('Inquiries'),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.electrical_services),
            // ignore: deprecated_member_use
            title: Text('Services'),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            // ignore: deprecated_member_use
            title: Text('Weather'),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            // ignore: deprecated_member_use
            title: Text('About Us'),
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gojek/constant.dart';
import 'package:gojek/beranda/beranda_view.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    BerandaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _container[_bottomNavCurrentIndex],
        bottomNavigationBar: _buildBottomNavigation());
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _bottomNavCurrentIndex = index;
        });
      },
      currentIndex: _bottomNavCurrentIndex,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home,
            color: GojekPalette.green,
          ),
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          title: Text('Beranda'),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.assignment,
            color: GojekPalette.green,
          ),
          icon: Icon(
            Icons.assignment,
            color: Colors.grey,
          ),
          title: Text('Pesanan'),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.mail,
            color: GojekPalette.green,
          ),
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
          title: Text('Inbox'),
        ),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: GojekPalette.green,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            title: Text('Akun')),
      ],
    );
  }
}

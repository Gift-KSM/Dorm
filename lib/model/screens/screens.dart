import 'package:flutter/material.dart';
import 'package:flutter_login/model/login.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_login/model/screens/home_screen.dart';

class Screens extends StatefulWidget {
  // const Screens({super.key});

  @override
  State<Screens> createState() => _ScreenState();
}

class _ScreenState extends State<Screens> {
  int _selctedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    // Logout()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selctedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          )
        ]),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 85, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey,
              hoverColor: Colors.grey,
              gap: 8,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 200),
              tabBackgroundColor: Colors.pinkAccent.shade200,
              color: Colors.black,
              tabs: [
                GButton(icon: LineIcons.home, text: 'Home'),
                GButton(
                    icon: LineIcons.alternateSignOut,
                    text: 'Logout',
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    })
              ],
              selectedIndex: _selctedIndex,
              onTabChange: (index) {
                setState(() {
                  _selctedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

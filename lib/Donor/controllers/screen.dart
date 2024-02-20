import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:gscapp/Authentication/screens/landingPage.dart';
import 'package:gscapp/Authentication/screens/signinscreen.dart';
import 'package:gscapp/Donor/screens/chat/chat.dart';
import 'package:gscapp/Donor/screens/donation/donation.dart';
import 'package:gscapp/Donor/screens/home/home_page.dart';
import 'package:gscapp/Donor/screens/profile/profile.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final List _pages = [HomePage(), Donation(), Chat(), Profile()];
  final List labellist = ["Home", "My Contribution", "Chat", "Profile"];
  int _selectedIndex = 0;

  void _navigateBottomBar(value) {
    // print(value);
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFEF9),
      appBar: AppBar(
        backgroundColor: Color(0xFF161733),
        title: Text(
          labellist[_selectedIndex],
          style: TextStyle(color: Colors.white),
        ),
        leading: labellist[_selectedIndex] == "Profile"
            ? IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => LandingPage(),
                    ),
                    (route) => false,
                  );
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
            : null,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 4),
        child: BottomNavigationBar(
          backgroundColor: Color(0XFF161733),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0XFFCED4DA),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: "Contribution"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: _navigateBottomBar,
        ),
      ),
    );
  }
}

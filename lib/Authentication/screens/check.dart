import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:gscapp/Donor/controllers/screen.dart";
import "package:gscapp/School/screens/HomeScreen/homescreen.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/services/firebase_services.dart";

class Check extends StatelessWidget {
  Check({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<String?>(
      future: _authService.getUserRole(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            // Handle error
            return Center(child: Text('Error occurred'));
          } else {
            String? role = snapshot.data;
            return role == 'School' ? Homescreen() : Screen();
          }
        }
      },
    ));
  }
}

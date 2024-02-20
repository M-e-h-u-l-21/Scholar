import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gscapp/School/model/school.dart';
import "package:flutter/material.dart";
import 'package:gscapp/School/screens/HomeScreen/homescreen.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future<bool> addSchool(School school) async {
    try {
      await _firestore.collection('schools').doc(user!.uid).set(school.toMap());
      return true;
    } catch (e) {
      print('Error in adding the School');
      return false;
    }
  }

  Future<void> createSchool(String name, String address, String udiseCode,
      String state, String city, int Contactno, BuildContext context) async {
    School newSchool = School(
        schoolName: name,
        address: address,
        udiseCode: udiseCode,
        state: state,
        city: city,
        contactno: Contactno);

    bool success = await addSchool(newSchool);
    if (success) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homescreen(),
      ));
    } else {
      print("Error!!!!");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gscapp/School/model/student.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  DocumentReference? studentRef;

  Future<bool> addStudent(Student student) async {
    try {
      await _firestore
          .collection('students')
          .doc(student.name)
          .set(student.toMap());
      studentRef = _firestore.collection('students').doc(student.name);
      return true;
    } catch (e) {
      print("Error while adding student:${e}");
      return false;
    }
  }

  Future<void> addStudentToSchool(String uid) async {
    try {
      // Update the school document to add the student reference
      await _firestore.collection('schools').doc(uid).update({
        'students': FieldValue.arrayUnion([studentRef]),
      });
      print("Ye pehle ho jaana chahiye");
    } catch (e) {
      print('Error adding student to school: $e');
      throw e;
    }
  }

  Future<void> createStudent(
    String name,
    int standard,
    String fathersName,
    String fathersOccupation,
    String mothersOccupation,
    int annualIncome,
    int numFamMembers,
    String schoolName,
    // Income Certificate
    // Performance Proof
    // Certificates if any
    int scholarNo,
    // Video of student
    String address,
    int stuContactNo,
    int guardContactNo,
    BuildContext context,
  ) async {
    Student newstudent = Student(
        name: name,
        standard: standard,
        fathersName: fathersName,
        fathersOccupation: fathersOccupation,
        mothersOccupation: mothersOccupation,
        annualIncome: annualIncome,
        numFamMembers: numFamMembers,
        schoolName: schoolName,
        scholarNo: scholarNo,
        address: address,
        stuContactNo: stuContactNo,
        guardContactNo: guardContactNo);
    bool success = await addStudent(newstudent);
    if (success) {
      await addStudentToSchool(user!.uid);
      // print("YE baad ka hai");
      Navigator.pop(context);
    }
  }
}

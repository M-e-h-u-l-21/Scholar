import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/School/model/student.dart";
import "package:flutter/material.dart";

class schoolStudentDataNotifier extends StateNotifier<Map<String, dynamic>> {
  schoolStudentDataNotifier() : super({});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<dynamic> studentRefs;
  DocumentReference? studentRef;
  User? user = FirebaseAuth.instance.currentUser;
  Future<Map<String, dynamic>> fetchStudentData() async {
    Map<String, dynamic> studentDataMap = {};

    DocumentReference schoolRef =
        FirebaseFirestore.instance.collection('schools').doc(user!.uid);

    DocumentSnapshot schoolDoc = await schoolRef.get();

    Map<String, dynamic>? schoolData =
        schoolDoc.data() as Map<String, dynamic>?;

    if (schoolData != null && schoolData.containsKey('students')) {
      studentRefs = schoolData['students'];
    }

    if (studentRefs != null && studentRefs.isNotEmpty) {
      for (DocumentReference studentRef in studentRefs) {
        DocumentSnapshot studentDoc = await studentRef.get();
        if (studentDoc.exists) {
          Map<String, dynamic>? studentData =
              studentDoc.data() as Map<String, dynamic>;
          String studentId = studentDoc.id;
          studentDataMap[studentId] = studentData;
        } else {
          print('Student document does not exist');
        }
      }
    } else {
      print('No students found');
    }
    state = studentDataMap;
    return studentDataMap;
  }

  Future<bool> addStudent(Student student) async {
    try {
      await _firestore
          .collection('students')
          .doc(student.name)
          .set(student.toMap());
      studentRef = _firestore.collection('students').doc(student.name);
      state = {...state, student.name: student.toMap()};
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

final schoolDataProvider =
    StateNotifierProvider<schoolStudentDataNotifier, Map<String, dynamic>>((ref) {
  return schoolStudentDataNotifier();
});

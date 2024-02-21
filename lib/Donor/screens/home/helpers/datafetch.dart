import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class fetchData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream get studentData => _firestore.collection('students');

  Future<Map<String, dynamic>> fetchStudentData() async {
    Map<String, dynamic> studentDataMap;
    QuerySnapshot studentDoc =
        await FirebaseFirestore.instance.collection('students').get();

    Map<String, dynamic>? studentData = {};
    studentDoc.docs.forEach((doc) {
      studentData[doc.id] = doc.data();
    });
    return studentData;
  }
}

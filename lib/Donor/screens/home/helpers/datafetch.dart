import 'package:cloud_firestore/cloud_firestore.dart';

class fetchData {
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

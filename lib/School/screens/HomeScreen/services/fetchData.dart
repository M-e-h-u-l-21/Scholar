import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class fetchData {
  late List<dynamic> studentRefs;
  User? user = FirebaseAuth.instance.currentUser;

  Future<Map<String, dynamic>> fetchStudentData() async {
    Map<String, dynamic> studentDataMap = {};

    // Assuming you have the school document reference
    DocumentReference schoolRef =
        FirebaseFirestore.instance.collection('schools').doc(user!.uid);

    // Get the school document
    DocumentSnapshot schoolDoc = await schoolRef.get();

    Map<String, dynamic>? schoolData =
        schoolDoc.data() as Map<String, dynamic>?;

    // Extract the array of student references

    if (schoolData != null && schoolData.containsKey('students')) {
      studentRefs = schoolData['students'];
      // Now you can use studentRefs...
    }

    if (studentRefs != null && studentRefs.isNotEmpty) {
      // Fetch data for each student
      for (DocumentReference studentRef in studentRefs) {
        DocumentSnapshot studentDoc = await studentRef.get();
        if (studentDoc.exists) {
          // Process student data here
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

    return studentDataMap;
  }
}

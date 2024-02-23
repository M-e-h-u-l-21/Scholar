import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/School/model/studentRequirement.dart";

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
User? user = _firebaseAuth.currentUser;

class studentDataNotifier extends StateNotifier<Map<String, dynamic>> {
  studentDataNotifier() : super({});

  Future<Map<String, dynamic>> fetchData() async {
    Map<String, dynamic> studentDataMap = {};
    QuerySnapshot studentDoc =
        await FirebaseFirestore.instance.collection("students").get();
    studentDoc.docs.forEach((doc) {
      studentDataMap[doc.id] = doc.data();
    });
    state = studentDataMap;
    print(studentDataMap);
    return studentDataMap;
  }

  Future<bool> addStudentRequirement(
      String studentName, studentRequirement requirement) async {
    try {
      final DocumentReference studentRef =
          FirebaseFirestore.instance.collection("students").doc(studentName);

      await studentRef.update({
        'requirements': FieldValue.arrayUnion([requirement.toMap()])
      });
      // print(state);
      fetchData();
      // final newState = {
      //   ...state,
      //   'requirements': state['requirements'].add(requirement.toMap()),
      // };
      // print("$state");
      // state = newState;
      return true;
    } catch (e) {
      print("Error Encountered");
    }
    return false;
  }

  Future<void> addRequirementToUser(
      String name, Map<String, dynamic> row, int amount) async {
    try {
      final DocumentReference userRef =
          FirebaseFirestore.instance.collection("users").doc(user!.uid);
      row['studentName'] = name;
      row['amount'] = amount;
      row['date'] = DateTime.now();
      await userRef.update({
        'contribution': FieldValue.arrayUnion([row])
      });
    } catch (e) {
      print("Error");
    }
  }

  Future<bool> requirementMet(List<int> index, String studentName) async {
    try {
      final DocumentReference studentRef =
          FirebaseFirestore.instance.collection("students").doc(studentName);
      DocumentSnapshot snapshot = await studentRef.get();

      if (snapshot.exists && snapshot.data() != null) {
        final List<dynamic> data;

        Map<String, dynamic>? studentData =
            snapshot.data() as Map<String, dynamic>?;

        // print(studentData);
        if (studentData != null && studentData.containsKey('requirements')) {
          data = studentData['requirements'];
          // print("###############Entered#################");
          // print("DATA : $data");

          for (int indexes in index) {
            Map<String, dynamic> mapToUpdate = data[indexes];
            mapToUpdate['isFulfilled'] = true;

            data[indexes] = mapToUpdate;

            await studentRef.update({'requirements': data});
            await addRequirementToUser(studentName, data[indexes], 10000);
            print('isMet field updated successfully.');
          }
        }
        fetchData();

        // print("Yahan tk sahi tha : $data");
        return true;
      } else {
        print('Document does not exist.');
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

final studentProvider =
    StateNotifierProvider<studentDataNotifier, Map<String, dynamic>>((ref) {
  return studentDataNotifier();
});

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/School/model/studentRequirement.dart";
import "package:gscapp/provider/user_dataprovider.dart";

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
    // print(studentDataMap);
    // print(state);
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

  Future<bool> requirementMet(
      List<int> index, String studentName, num amount) async {
    try {
      final DocumentReference studentRef =
          FirebaseFirestore.instance.collection("students").doc(studentName);
      DocumentSnapshot snapshot = await studentRef.get();

      if (snapshot.exists && snapshot.data() != null) {
        final List<dynamic> data;

        Map<String, dynamic>? studentData =
            snapshot.data() as Map<String, dynamic>?;

        if (studentData != null && studentData.containsKey('requirements')) {
          data = studentData['requirements'];
          Map<String, dynamic> arr = {};
          for (int indexes in index) {
            Map<String, dynamic> mapToUpdate = data[indexes];

            mapToUpdate['isFulfilled'] = true;

            data.removeAt(indexes);

            data.insert(data.length, mapToUpdate);
            await studentRef.update({'requirements': data});
            fetchData();
            arr = {...data[indexes]};
          }
          await userDataNotifier()
              .addRequirementToUser(studentName, arr, amount);

          print('isMet field updated successfully.');
        }
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class userDataNotifier extends StateNotifier<Map<String, dynamic>> {

  User? user = FirebaseAuth.instance.currentUser;
  userDataNotifier() : super({});

  Future<void> getUserData() async {
    Map<String, dynamic> userDataMap = {};
    final data = await FirebaseFirestore.instance.collection('users').get();
    data.docs.forEach((doc) {
      userDataMap[doc.id] = doc.data();
    });
    state = userDataMap;
  }

  // List<Map<String,dynamic>> dataWithUID() {
  //   return state[user!.uid]['contribution'];
  // }

  Future<void> addRequirementToUser(
      String name, Map<String, dynamic> row, num amount) async {
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
}

final userData = StateNotifierProvider((ref) {
  return userDataNotifier();
});

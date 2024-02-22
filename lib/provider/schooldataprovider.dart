import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class schoolDataNotifier extends StateNotifier<Map<String, dynamic>> {
  User? user = FirebaseAuth.instance.currentUser;
  schoolDataNotifier() : super({});

  Future<void> getSchoolData() async {
    Map<String, dynamic> schoolDataMap = {};
    final data = await FirebaseFirestore.instance.collection("schools").get();
    data.docs.forEach((doc) {
      schoolDataMap[doc.id] = doc.data();
    });
    state = schoolDataMap;
  }

  String getSchoolName()  {
    return state[user!.uid]['name'];
  }
}

final schoolData = StateNotifierProvider<schoolDataNotifier,Map<String,dynamic>>((ref) {
  return schoolDataNotifier();
});

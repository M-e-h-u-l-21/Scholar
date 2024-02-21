import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:get/get.dart";

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

}

final studentProvider =
    StateNotifierProvider<studentDataNotifier, Map<String, dynamic>>((ref) {
  return studentDataNotifier();
});

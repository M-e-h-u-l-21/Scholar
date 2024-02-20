import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future<String?> getSchoolName() async {
    if (user != null) {
      try {
        DocumentSnapshot docSnapshot =
            await _firebaseFirestore.collection('schools').doc(user!.uid).get();
        if (docSnapshot.exists) {
          String? schoolName = docSnapshot.get('name');
          return schoolName;
        } else {
          print("User is not signed in ");
          return null;
        }
      } catch (e) {
        print("Error getting school name");
        throw e;
      }
    }
  }
}

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class FirestoreService {
  final CollectionReference userRolesCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUserRole(String uid, String role) async {
    await userRolesCollection.doc(uid).set({'role': role});
  }

  Future<String> getUserRole(String uid) async {
    DocumentSnapshot snapshot = await userRolesCollection.doc(uid).get();
    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        return data['role'];
      }
    }
    return "defaultRole";
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  Future<User> signInWithGoogle(BuildContext context, String rolep) async {
    // Sign in with Google
    UserCredential userCredential =
        await _auth.signInWithProvider(GoogleAuthProvider());
    if (userCredential.additionalUserInfo!.isNewUser) {
      // If it's a new user, prompt for role selection
      String? role = rolep;
      if (role != null) {
        // Set user's role
        await _firestoreService.setUserRole(userCredential.user!.uid, role);
      } else {
        // Handle null role
        // This could happen if the user closes the dialog without selecting a role
        print('User did not select a role.');
      }
    }
    return userCredential.user!;
  }

  Future<String?> getUserRole() async {
    String uid = _auth.currentUser!.uid;
    String role = await _firestoreService.getUserRole(uid);

    return role;
  }
}

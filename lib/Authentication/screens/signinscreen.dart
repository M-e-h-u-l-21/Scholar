import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:gscapp/Donor/controllers/screen.dart";
import "package:gscapp/School/screens/HomeScreen/homescreen.dart";
import "package:gscapp/School/screens/Registration/registrationscreen.dart";
import "package:gscapp/utils/services/firebase_services.dart";

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key, required this.rolepass}) : super(key: key);
  final String rolepass;
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();
  User? _user = FirebaseAuth.instance.currentUser;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    String rolep = widget.rolepass;
    return Scaffold(
      body: _user != null
          ? FutureBuilder<String?>(
              future: _authService.getUserRole(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    // Handle error
                    return Center(child: Text('Error occurred'));
                  } else {
                    String? role = snapshot.data;
                    return role == 'School' ? Homescreen() : Screen();
                  }
                }
              },
            )
          : Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Set loading state
                  setState(() {
                    _isLoading = true;
                  });

                  // Perform sign-in operation
                  User? user =
                      await _authService.signInWithGoogle(context, rolep);
                  if (user != null) {
                    // Fetch user role
                    String? role = await _authService.getUserRole();

                    // Navigate to appropriate screen based on user role
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            role == 'School' ? Registrationscreen() : Screen(),
                      ),
                    );
                  }

                  // Reset loading state after a slight delay to ensure the progress indicator is visible
                  Future.delayed(Duration(milliseconds: 500), () {
                    setState(() {
                      _isLoading = false;
                    });
                  });
                },
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text('Sign in with Google'),
              ),
            ),
    );
  }
}

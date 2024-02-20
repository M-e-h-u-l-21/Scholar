import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:gscapp/Authentication/screens/signinscreen.dart";
import "package:gscapp/Donor/controllers/screen.dart";
import "package:gscapp/School/screens/HomeScreen/homescreen.dart";
import "package:gscapp/utils/services/firebase_services.dart";

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isClicked = false;
  final AuthService _authService = AuthService();
  User? _user = FirebaseAuth.instance.currentUser;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                  ),

                  Text(
                    "Already registered ?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          User? user =
                              await _authService.signInWithGoogle(context, "");
                          String? role = await _authService.getUserRole();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  role == 'School' ? Homescreen() : Screen(),
                            ),
                          );
                          Future.delayed(Duration(milliseconds: 100), () {
                            setState(() {
                              _isLoading = false;
                            });
                          });
                        },
                        child: Text("Sign in with Google"),
                      )),

                  Container(
                    child: Divider(color: Colors.black),
                  ),

                  Text(
                    "New to app ?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: isClicked
                        ? SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          SignInScreen(rolepass: "School"),
                                    ));
                                  },
                                  child: Text("as School"),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            SignInScreen(rolepass: "Donor"),
                                      ));
                                    },
                                    child: Text("as Donor"))
                              ],
                            ))
                        : TextButton(
                            onPressed: () {
                              setState(() {
                                isClicked = true;
                              });
                            },
                            child: Text("Register")),
                  )

                  // TextButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => SignInScreen(rolepass: "School"),
                  //       ));
                  //     },
                  //     child: Text("Register as School")),
                  // TextButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => SignInScreen(rolepass: "Donor"),
                  //       ));
                  //     },
                  //     child: Text("Register as Donor")),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading)
          // Overlay with gray background
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ]),
    );
  }
}

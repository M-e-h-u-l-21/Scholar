import "package:flutter/material.dart";
import "package:gscapp/School/screens/HomeScreen/homescreen.dart";


class ScreenSchool extends StatelessWidget {
const ScreenSchool({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Homescreen(),
    );
  }
}
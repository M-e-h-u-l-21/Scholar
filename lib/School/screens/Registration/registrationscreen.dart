import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:gscapp/School/model/school.dart';
import 'package:gscapp/School/screens/NewStudent/widgets/formfield.dart';
import 'package:gscapp/School/screens/Registration/services/firebaseServices.dart';
import 'package:gscapp/utils/constants/device_utility.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({Key? key}) : super(key: key);

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  String _schoolName = "";
  String udiseCode = "";
  String state = "";
  String city = "";
  String address = "";
  late int contactNo;

  @override
  Widget build(BuildContext context) {
    final width = TDeviceUtils.getScreenWidth(context);
    final height = TDeviceUtils.getScreenHeight(context);
    final FirebaseService _firebaseservice = FirebaseService();
    return Scaffold(
      body: Column(
        children: [
          Text("Register"),
          FormItem(
            width: double.infinity,
            fieldname: "School Name",
            onChanged: (value) {
              setState(() {
                _schoolName = value;
              });
            },
          ),
          Row(
            children: [
              FormItem(
                width: width * 0.4,
                fieldname: "UDISE Code",
                onChanged: (value) {
                  setState(() {
                    udiseCode = value;
                  });
                },
              ),
              FormItem(
                  width: width * 0.5,
                  fieldname: "ContactNo",
                  onChanged: (value) {
                    setState(() {
                      contactNo = int.parse(value);
                    });
                  })
            ],
          ),
          Row(
            children: [
              FormItem(
                width: width * 0.4,
                fieldname: "State",
                onChanged: (value) {
                  setState(() {
                    state = value;
                  });
                },
              ),
              FormItem(
                width: width * 0.4,
                fieldname: "City",
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
              )
            ],
          ),
          FormItem(
            width: width,
            fieldname: "Address",
            onChanged: (value) {
              setState(() {
                address = value;
              });
            },
          ),
          TextButton(
              onPressed: () {
                _firebaseservice.createSchool(_schoolName, address, udiseCode,
                    state, city, contactNo, context);
              },
              child: Text("Register"))
        ],
      ),
    );
  }
}

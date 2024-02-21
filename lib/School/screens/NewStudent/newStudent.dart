import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:gscapp/School/model/student.dart";
import "package:gscapp/School/screens/NewStudent/helper/firebasehelper.dart";
import "package:gscapp/School/screens/NewStudent/services/firebase_services.dart";
import "package:gscapp/School/screens/NewStudent/widgets/formfield.dart";
import "package:gscapp/School/screens/NewStudent/widgets/uploadfield.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class NewStudent extends StatefulWidget {
  final void Function(Student)? updateStudentDataCallback;
  const NewStudent({Key? key, required this.updateStudentDataCallback, })
      : super(key: key);
  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  String _studentname = "";
  late int grade = 0; //TODO: Fix this 0 initialisation
  late int scholarNo = 0;
  String _fatherName = "";
  String _address = "";
  String _fatheroccupation = "";
  String _motheroccuptation = "";
  late int famcount = 0;
  late int annualincome = 0;
  late int stucontactno = 0;
  late int guardcontactno = 0;

  final FirebaseService _firebaseService = FirebaseService();
  final FirebaseHelper _firebaseHelper = FirebaseHelper();

  @override
  Widget build(BuildContext context) {
    final width = TDeviceUtils.getScreenWidth(context);
    final height = TDeviceUtils.getScreenHeight(context);
    User? user =
        FirebaseAuth.instance.currentUser; //Fix this , use state management

    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      appBar: AppBar(
        backgroundColor: ThemeColors.deepblue,
        title: Text("New Student",
            style: TextStyle(
              color: Colors.white,
            )),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FormItem(
                width: width,
                fieldname: "Student's Name",
                onChanged: (value) {
                  setState(() {
                    _studentname = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormItem(
                    width: width * 0.2,
                    fieldname: "Class",
                    onChanged: (value) {
                      setState(() {
                        grade = int.parse(value);
                      });
                    },
                  ),
                  FormItem(
                    width: width * 0.4,
                    fieldname: "Scholar Number",
                    onChanged: (value) {
                      setState(() {
                        scholarNo = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(
                    width: width * 0.01,
                  )
                ],
              ),
              FormItem(
                width: width,
                fieldname: "Father's Name",
                onChanged: (value) {
                  setState(() {
                    _fatherName = value;
                  });
                },
              ),
              FormItem(
                width: width,
                fieldname: "Address",
                onChanged: (value) {
                  setState(() {
                    _address = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormItem(
                    width: width * 0.4,
                    fieldname: "Father's Occupation",
                    onChanged: (value) {
                      setState(() {
                        _fatheroccupation = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  FormItem(
                    width: width * 0.45,
                    fieldname: "Mother's Occupation",
                    onChanged: (value) {
                      setState(() {
                        _motheroccuptation = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormItem(
                    width: width * 0.405,
                    fieldname: "Family Member Count",
                    onChanged: (value) {
                      setState(() {
                        famcount = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  FormItem(
                    width: width * 0.45,
                    fieldname: "Annual Income",
                    onChanged: (value) {
                      setState(() {
                        annualincome = int.parse(value);
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormItem(
                    width: width * 0.405,
                    fieldname: "Contact No",
                    onChanged: (value) {
                      setState(() {
                        stucontactno = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  FormItem(
                    width: width * 0.45,
                    fieldname: "Guardian Contact No",
                    onChanged: (value) {
                      setState(() {
                        guardcontactno = int.parse(value);
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Uploadfield(
                    fieldname: "Income Certificate",
                    width: width * 0.4,
                  ),
                  Uploadfield(
                      fieldname: "Report Card (Past 3 years)",
                      width: width * 0.45)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Uploadfield(
                      fieldname: "Achievement Certificate (if any)",
                      width: width * 0.4),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Uploadfield(fieldname: "Student's Video", width: width * 0.3)
                ],
              ),
              TextButton(
                  onPressed: () => widget.updateStudentDataCallback!(Student(
                      name: _studentname,
                      standard: grade,
                      fathersName: _fatherName,
                      fathersOccupation: _fatheroccupation,
                      mothersOccupation: _motheroccuptation,
                      annualIncome: annualincome,
                      numFamMembers: famcount,
                      schoolName: "",
                      scholarNo: scholarNo,
                      address: _address,
                      stuContactNo: stucontactno,
                      guardContactNo: guardcontactno)),
                  child: Text("Submit Application"))
            ],
          ),
        ),
      ),
    );
  }
}

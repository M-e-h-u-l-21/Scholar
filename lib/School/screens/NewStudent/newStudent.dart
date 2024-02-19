import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:gscapp/School/screens/NewStudent/widgets/formfield.dart";
import "package:gscapp/School/screens/NewStudent/widgets/uploadfield.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class NewStudent extends StatelessWidget {
  const NewStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = TDeviceUtils.getScreenWidth(context);
    final height = TDeviceUtils.getScreenHeight(context);

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
          child: Form(
            child: Column(
              children: [
                FormItem(
                  width: width,
                  fieldname: "Student's Name",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormItem(width: width * 0.2, fieldname: "Class"),
                    FormItem(width: width * 0.4, fieldname: "Scholar Number"),
                    SizedBox(
                      width: width * 0.01,
                    )
                  ],
                ),
                FormItem(width: width, fieldname: "Father's Name"),
                FormItem(width: width, fieldname: "Address"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormItem(
                        width: width * 0.4, fieldname: "Father's Occupation"),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    FormItem(
                        width: width * 0.45, fieldname: "Mother's Occupation"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormItem(
                        width: width * 0.405, fieldname: "Family Member Count"),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    FormItem(width: width * 0.45, fieldname: "Annual Income"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormItem(width: width * 0.405, fieldname: "Contact No"),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    FormItem(
                        width: width * 0.45, fieldname: "Guardian Contact No"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Uploadfield(
                        fieldname: "Income Certificate", width: width * 0.4),
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
                    Uploadfield(
                        fieldname: "Student's Video", width: width * 0.3)
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Submit Application"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

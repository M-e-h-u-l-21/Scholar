import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentInfoBar.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentInfoCard.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentPOV.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/teacherremark.dart";
import "package:gscapp/School/model/studentRequirement.dart";
import "package:gscapp/School/screens/StudentProfile/widgets/requirementrow.dart";
import 'package:gscapp/School/screens/StudentProfile/widgets/requirementsBottomSheet.dart';
import "package:gscapp/provider/student_dataprovider.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class Studentprofile extends ConsumerStatefulWidget {
  const Studentprofile({super.key, required this.name});

  final String name;

  @override
  _StudentprofileState createState() => _StudentprofileState();
}

class _StudentprofileState extends ConsumerState<Studentprofile> {
  void _openBottomModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Wrap(children: [
        RequirementsBottomSheet(
          name: widget.name,
        )
      ]),
      // constraints:
      //     BoxConstraints.expand(width: TDeviceUtils.getScreenWidth(context))
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.name;
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);
    final data = ref.watch(studentProvider);
    final studentinfo = {name: data[name]};
    // print("#########${studentinfo[name]['requirements']}#############");
    final requirements = studentinfo[name]['requirements'];
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.scaffold,
        body: SingleChildScrollView(
          child: Column(
            children: [
              studentInfoTopBar(stuname: name),
              SizedBox(
                height: height * 0.010,
              ),
              Text(
                "Support his Education",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Niramit'),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.038, right: width * 0.038),
                child: StudentInfoRow(),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: width * 0.03),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Requirements",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      IconButton(
                          onPressed: _openBottomModal,
                          icon: Icon(
                            Icons.edit,
                          ))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: requirements.length,
                          itemBuilder: (context, index) {
                            return Requirementrow(
                                title: requirements[index]['title'],
                                amount: requirements[index]['amount'],
                                description: requirements[index]
                                    ['description']);
                          },
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: width * 0.01),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Remarks from Teachers",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                            )),
                      )
                    ]),
              ),
              TeacherRemark(height: height, width: width),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              StudentPov(width: width, height: height),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

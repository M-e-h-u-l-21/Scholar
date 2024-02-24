import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/School/model/studentRequirement.dart";
import "package:gscapp/provider/student_dataprovider.dart";
import "package:gscapp/utils/constants/device_utility.dart";
import "package:gscapp/utils/constants/objects.dart";

class RequirementsBottomSheet extends ConsumerStatefulWidget {
  RequirementsBottomSheet({required this.name, super.key});

  String name;
  @override
  ConsumerState<RequirementsBottomSheet> createState() =>
      _RequirementsBottomSheetState();
}

class _RequirementsBottomSheetState
    extends ConsumerState<RequirementsBottomSheet> {
  final _titleController = TextEditingController();
  final _lastDateController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _lastDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    RegExp uniformRegexA = RegExp(r'uniform', caseSensitive: false);
    RegExp semesterFeeRegexA =
        RegExp(r'schoola semester fee', caseSensitive: false);
    // RegExp uniformRegexB = RegExp(r'schoolb uniform', caseSensitive: false);
    RegExp semesterFeeRegexB =
        RegExp(r'schoolb semester fee', caseSensitive: false);
    RegExp stationaryRegex = RegExp(r'stationary', caseSensitive: false);

    //TODO Styling of card
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);

    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          Text(
            "Add Requirement",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          // SizedBox(
          //   height: height * 0.01,
          // ),
          // SizedBox(
          //   width: double.infinity,
          //   child: Text(
          //     "Title",
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
          // SizedBox(
          //   height: height * 0.01,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(color: Colors.black, width: 1)),
          //   child: TextField(
          //     controller: _titleController,
          //     decoration: InputDecoration(border: InputBorder.none),
          //   ),
          // ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      "Title",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    width: width * 0.4,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1)),
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8)),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      "Deadline",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    width: width * 0.4,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1)),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () => _selectDate(context),
                            icon: Icon(Icons.edit_calendar)),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),

                    // TextField(
                    //   controller: _lastDateController,
                    //   decoration: InputDecoration(
                    //       border:
                    //           InputBorder.none), //TODO : Change this to date
                    // ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
              width: double.infinity,
              child: Text(
                "Description",
                style: TextStyle(fontSize: 18),
              )),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  border: InputBorder.none, contentPadding: EdgeInsets.all(8, )),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          ElevatedButton(
              onPressed: () async {
                bool uniform = uniformRegexA.hasMatch(_titleController.text);
                bool semesterFeeA =
                    semesterFeeRegexA.hasMatch(_titleController.text);
                bool semesterFeeB =
                    semesterFeeRegexB.hasMatch(_titleController.text);
                bool stationary =
                    stationaryRegex.hasMatch(_titleController.text);
                final ans = await ref
                    .read(studentProvider.notifier)
                    .addStudentRequirement(
                        //Fix this issue
                        //TODO : Add Internet Check
                        widget.name,
                        studentRequirement(
                            title: _titleController.text,
                            amount: uniform
                                ? Uniform.totalUniformBoy
                                : semesterFeeA
                                    ? SchoolA.totalA
                                    : semesterFeeB
                                        ? SchoolB.totalB
                                        : stationary
                                            ? Stationary.Total
                                            : 0,
                            deadline: selectedDate,
                            description: _descriptionController.text));
                if (ans) {
                  Navigator.pop(context);
                }
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}

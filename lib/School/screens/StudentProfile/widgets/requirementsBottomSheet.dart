import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/School/model/studentRequirement.dart";
import "package:gscapp/provider/student_dataprovider.dart";
import "package:gscapp/utils/constants/device_utility.dart";

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
  final _amountController = TextEditingController();
  final _lastDateController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _lastDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO Styling of card
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        children: [
          Text(
            "Add Requirement",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Title",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
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
                      "Amount",
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
                      controller: _amountController,
                      decoration: InputDecoration(border: InputBorder.none),
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
                    child: TextField(
                      controller: _lastDateController,
                      decoration: InputDecoration(
                          border:
                              InputBorder.none), //TODO : Change this to date
                    ),
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
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          ElevatedButton(
              onPressed: () async {
                final ans = await ref
                    .read(studentProvider.notifier)
                    .addStudentRequirement(
                        //Fix this issue
                        //TODO : Add Internet Check
                        widget.name,
                        studentRequirement(
                            title: _titleController.text,
                            amount: _amountController.text,
                            date: _lastDateController.text,
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

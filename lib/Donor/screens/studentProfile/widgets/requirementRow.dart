import "package:flutter/material.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class Requirementrow extends StatefulWidget {
  const Requirementrow(
      {Key? key,
      required this.title,
      required this.amount,
      required this.description,
      required this.onCheckBoxSelected,
      required this.index})
      : super(key: key);
  final String title;
  final String amount;
  final String description;
  final int index;
  final Function(int index, bool isSelected) onCheckBoxSelected;
  @override
  State<Requirementrow> createState() => _RequirementrowState();
}

class _RequirementrowState extends State<Requirementrow> {
  List<int> _selectedCard = [];
  //TODO Fix design
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    final width = TDeviceUtils.getScreenWidth(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: _isSelected,
            onChanged: (value) {
              setState(() {
                _isSelected = value ?? false;
                // Call the callback function to notify the parent widget
                widget.onCheckBoxSelected(widget.index, _isSelected);
                print(widget.index);
              });
            },
          ),
          SizedBox(
            width: width * 0.03,
          ),
          SizedBox(
              width: width * 0.43,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 18),
              )),
          SizedBox(
            width: width * 0.13,
          ),
          SizedBox(
            width: width * 0.13,
            child: Text(
              widget.amount,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

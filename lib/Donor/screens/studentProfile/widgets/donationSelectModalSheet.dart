import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:gscapp/Donor/screens/donationPayment/donationDetail.dart';
import "package:gscapp/Donor/screens/studentProfile/widgets/requirementRow.dart";
import "package:gscapp/provider/student_dataprovider.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class DonationSelectModalSheet extends ConsumerStatefulWidget {
  DonationSelectModalSheet({super.key, required this.name});

  String name;

  @override
  _DonationSelectModalSheetState createState() =>
      _DonationSelectModalSheetState();
}

class _DonationSelectModalSheetState
    extends ConsumerState<DonationSelectModalSheet> {
  List<int> _selectedCard = [];

  @override
  Widget build(BuildContext context) {
    final name = widget.name;
    final data = ref.watch(studentProvider);
    final studentinfo = {name: data[name]};
    final requirements = (studentinfo[name]['requirements'] as List)
        .where((req) => req['isFulfilled'] == false)
        .toList();
    final width = TDeviceUtils.getScreenWidth(context);

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        SizedBox(
            width: double.infinity,
            child: Text(
              "Select Donation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )),
        SizedBox(
          height: 16,
        ),
        requirements.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.195),
                    child: Row(
                      children: [
                        SizedBox(
                            width: width * 0.51, child: Text("Requirements")),
                        Text("Amount"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 4),
                    child: Container(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: requirements.length,
                              itemBuilder: (context, index) {
                                return Requirementrow(
                                  index: index,
                                  title: requirements[index]['title'],
                                  amount: requirements[index]['amount'],
                                  description: requirements[index]
                                      ['description'],
                                  onCheckBoxSelected:
                                      (selectedIndex, isSelected) {
                                    if (isSelected) {
                                      _selectedCard.add(selectedIndex);
                                      // print(_selectedCard);
                                    } else {
                                      _selectedCard.remove(selectedIndex);
                                      // print(_selectedCard);
                                    }
                                  },
                                );
                              },
                            ))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DonationDetail(
                              selectedIndex: _selectedCard,
                              studentName: name,
                            ),
                          ));
                    },
                    child: Text("Make Donation"),
                  )
                ],
              )
            : Text("No requirement left"),
      ]),
    );
  }
}

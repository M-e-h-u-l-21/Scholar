import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/Donor/controllers/screen.dart";
import 'package:gscapp/Donor/screens/donationPayment/widgets/detailCard.dart';
import "package:gscapp/Donor/screens/home/home_page.dart";
import "package:gscapp/provider/student_dataprovider.dart";
import "package:gscapp/utils/constants/colors.dart";

class DonationDetail extends ConsumerWidget {
  const DonationDetail(
      {super.key, required this.selectedIndex, required this.studentName});
  final List<int> selectedIndex;
  final String studentName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(studentProvider);
    final studentinfo = {studentName: data[studentName]};
    final List<dynamic> requirements = studentinfo[studentName]['requirements'];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Destination of Your Donation",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[900]),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "Amount",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: selectedIndex.map((index) {
                        if (index >= 0 && index < requirements.length) {
                          return DetailCard(
                            title: requirements[index]['title'],
                          );
                        } else {
                          return Text('Invalid index: $index');
                        }
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await ref
                            .watch(studentProvider.notifier)
                            .requirementMet(selectedIndex, studentName);
                        const snackbar = SnackBar(
                          content: Text("Donation Completed"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Screen(),
                            ));
                      },
                      child: Text("Donate ₹11600"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

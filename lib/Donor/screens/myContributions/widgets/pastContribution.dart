import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/Donor/screens/myContributions/widgets/pastContributionCard.dart";
import "package:gscapp/provider/user_dataprovider.dart";
import "package:gscapp/utils/constants/colors.dart";
import 'package:gscapp/Donor/screens/myContributions/widgets/paymentcard.dart';
import "package:gscapp/utils/constants/device_utility.dart";
import "package:intl/intl.dart";

class PastContribution extends ConsumerStatefulWidget {
  const PastContribution({Key? key}) : super(key: key);

  @override
  ConsumerState<PastContribution> createState() => _PastContributionState();
}

class _PastContributionState extends ConsumerState<PastContribution> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String previous = "";
    final height = TDeviceUtils.getScreenHeight(context);
    final data = ref.watch(userData);

    final Map<String, dynamic>? userDataMap = data as Map<String, dynamic>?;

    final Map<String, dynamic> usrData;

    String formatDate(String inputDateTimeString) {
      DateTime dateTime = DateTime.parse(inputDateTimeString);

      String formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);

      return formattedDate;
    }

    if (userDataMap != null) {
      usrData = userDataMap[user!.uid] ?? {};
      final List<dynamic> myContributions = [];
      if (usrData.containsKey('contribution')) {
        myContributions.addAll(usrData['contribution']);
      }
      myContributions.sort((a, b) {
        if (a['date'] is! Timestamp || b['date'] is! Timestamp) {
          return 0;
        }
        return (b['date'] as Timestamp).compareTo(a['date'] as Timestamp);
      });
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Wrap(children: [
                  SizedBox(
                    height: height * 0.42,
                    child: ListView.builder(
                      itemCount: myContributions.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final Timestamp tp = myContributions[index]['date'];
                        String val = formatDate(tp.toDate().toString());
                        bool prev = (previous == val);
                        print(previous);
                        previous = val;
                        return PastContributionCard(
                          amount: myContributions[index]['amount'],
                          date: tp.toDate(),
                          name: myContributions[index]['studentName'],
                          previous: prev,
                        );
                      },
                    ),
                  ),
                ]),
              ],
            ),
          )
        ],
      );
    } else {
      return Text("Data could not be fetched");
    }
  }
}

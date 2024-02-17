import "package:flutter/material.dart";
import "package:gscapp/volunteer/screens/donation/widgets/pastContribution.dart";
import "package:gscapp/volunteer/screens/donation/widgets/upcomingPayment.dart";

class Donation extends StatelessWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              UpcomingContribution(),
              SizedBox(
                height: 24,
              ),
              PastContribution()
            ],
          ),
        ),
      ),
    );
  }
}

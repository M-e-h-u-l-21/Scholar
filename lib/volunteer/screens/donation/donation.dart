import "package:flutter/material.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/volunteer/screens/donation/widgets/pastContribution.dart";
import "package:gscapp/volunteer/screens/donation/widgets/upcomingPayment.dart";

class Donation extends StatelessWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.28,
              color: Colors.amberAccent,
            ),
          ),

          Expanded(
            child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: MediaQuery.of(context).size.height * 0.01,
                    bottom: const TabBar(tabs: [
                      Tab(
                        text: "Upcoming Contribution",
                      ),
                      Tab(
                        text: "Past Contribution",
                      )
                    ]),
                  ),
                  body: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 16, right: 16),
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: UpcomingContribution(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 16, right: 16),
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: PastContribution(),
                          ),
                        )
                      ]),
                )),
          )
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         UpcomingContribution(),
          //         SizedBox(
          //           height: 24,
          //         ),
          //         PastContribution()
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

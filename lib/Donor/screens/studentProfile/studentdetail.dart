import "package:flutter/material.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class Studentdetail extends StatelessWidget {
  const Studentdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.scaffold,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.22,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48)),
                  color: ThemeColors.deepblue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Back button , image , info
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            color: Colors.white,
                          ),
                          Container(
                            width: 100,
                            height: height * 0.135,
                            color: Colors.white,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      //Name of the kid
                      Text(
                        "Ronit Gupta",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0XFFFFECD0),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Image(
                            image: AssetImage('assets/images/graduation.png'),
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            "St Xavier School",
                            style: TextStyle(fontSize: 18),
                          )
                        ]),
                      ),
                    ),
                    Container(
                      height: height * 0.04,
                      child: VerticalDivider(color: Colors.black, thickness: 1),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0XFFFFECD0),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Image(
                            image: AssetImage('assets/images/graduation.png'),
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            "8th",
                            style: TextStyle(fontSize: 18),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 12),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFFFECD0),
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        //Donation goal
                        Row(
                          children: [
                            Text(
                              "Donation Goal",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),

                        //Progress bar + days left
                        Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: 0.75,
                                minHeight: 6,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.08,
                            ),
                            Text(
                              "6/10 days",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),

                        //Target + Raised
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Target : ₹12000",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Raised : ₹8000",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ]),
                    )),
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
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Remarks from Teachers",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0XFFFFECD0),
                          borderRadius: BorderRadius.circular(8)),
                      height: height * 0.15,
                      width: width * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "`One of his own kind`",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        height: height * 0.008,
                                      ),
                                      SizedBox(
                                        width: width * 0.8,
                                        child: Expanded(
                                          child: Text(
                                            "The diligent nature of Rahul is his biggest strength and his attitude towards learning is what makes him really unique..",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "- Nihal Parera ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "(Class Teacher)",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0XFFFFECD0),
                          borderRadius: BorderRadius.circular(8)),
                      height: height * 0.15,
                      width: width * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "`One of his own kind`",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        height: height * 0.008,
                                      ),
                                      SizedBox(
                                        width: width * 0.8,
                                        child: Expanded(
                                          child: Text(
                                            "The diligent nature of Rahul is his biggest strength and his attitude towards learning is what makes him really unique..",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "- Nihal Parera ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "(Class Teacher)",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * 0.7,
                        child: Text(
                          "Listen to Rahul's Eagerness to study and fulfill his dreams",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/images/graduation.png'),
                        height: height * 0.06,
                        width: width * 0.2,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              TextButton(
                onPressed: () {},
                child: Text("Donate Now"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

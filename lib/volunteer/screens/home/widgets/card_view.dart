import "package:flutter/material.dart";
import 'package:gscapp/volunteer/screens/donationtype/screens/donationtype.dart';
import "package:gscapp/volunteer/screens/studentProfile/studentdetail.dart";

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Studentdetail())),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: 300,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 233, 219),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.cyan,
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Student Name")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Text(
                      "•Temp1",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "•Temp2",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "•Temp3",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "•Temp4",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Donationtype()));
                        },
                        child: Text("Support Now"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

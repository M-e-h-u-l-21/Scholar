import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/home/helpers/datafetch.dart';
import 'package:gscapp/utils/constants/colors.dart';
import 'package:gscapp/Donor/screens/home/widgets/horizontal_scroll_complete.dart';
import 'package:gscapp/Donor/screens/home/widgets/top_carousel.dart';
import 'package:gscapp/Donor/screens/home/widgets/urgentScroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> studentData = {};
  fetchData _fetchData = fetchData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAndSetStudentData();
  }

  Future<void> fetchAndSetStudentData() async {
    Map<String, dynamic> data = await _fetchData.fetchStudentData();
    setState(() {
      studentData = data;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Banner
              Carousel(),

              SizedBox(
                height: 16,
              ),

              Divider(
                thickness: 2,
              ),

              HorizontalScroll(),

              SizedBox(
                height: 6,
              ),

              Divider(
                thickness: 2,
              ),

              Text(
                "Most urgent projects",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Niramit',
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[900]),
              ),

              SizedBox(
                height: 4,
              ),

              Text(
                "CLOSEST TO FINISH LINE + LEAST DAY LEFT",
                style: Theme.of(context).textTheme.labelSmall,
              ),

              SizedBox(
                height: 8,
              ),

              UrgentScroll(studentData: studentData,),

              SizedBox(
                height: 16,
              ),

              Text(
                "Students in your region",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Niramit',
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[900]),
              ),

              SizedBox(
                height: 4,
              ),

              Text(
                "COLLABORATE WITH OTHERS + HELP TOGETHER",
                style: Theme.of(context).textTheme.labelSmall,
              ),

              SizedBox(
                height: 8,
              ),

              UrgentScroll(
                studentData: studentData,
              ),

              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

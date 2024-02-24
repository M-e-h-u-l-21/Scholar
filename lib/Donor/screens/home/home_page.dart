import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gscapp/Donor/screens/home/helpers/datafetch.dart';
import 'package:gscapp/provider/school_studentdataprovider.dart';
import 'package:gscapp/provider/student_dataprovider.dart';
import 'package:gscapp/provider/user_dataprovider.dart';
import 'package:gscapp/utils/constants/colors.dart';
import 'package:gscapp/Donor/screens/home/widgets/horizontal_scroll_complete.dart';
import 'package:gscapp/Donor/screens/home/widgets/top_carousel.dart';
import 'package:gscapp/Donor/screens/home/widgets/urgentScroll.dart';
import 'package:simple_fx/simple_fx.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Map<String, dynamic> studentData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(studentProvider.notifier).fetchData();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(schoolDataProvider.notifier).fetchStudentData();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userData.notifier).getUserData();
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
              SizedBox(
                height: 16,
              ),
              //Banner
              Container(
                  height: 180,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: SimpleFX(
                          imageSource: Image(
                            image: AssetImage('assets/images/hope.jpg'),
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                          brightness: -5,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Read more about',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text("Our Success stories",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 50,
                            ),
                          ))
                    ],
                  )),

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

              UrgentScroll(),

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

              UrgentScroll(),

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

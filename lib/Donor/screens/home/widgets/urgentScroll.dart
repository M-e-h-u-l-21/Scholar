import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gscapp/Donor/screens/home/widgets/card_view.dart';
import 'package:gscapp/provider/student_dataprovider.dart';

class UrgentScroll extends ConsumerStatefulWidget {
  const UrgentScroll({
    super.key,
  });

  @override
  ConsumerState<UrgentScroll> createState() => _UrgentScrollState();
}

class _UrgentScrollState extends ConsumerState<UrgentScroll> {
  @override
  Widget build(BuildContext context) {
    final studentData = ref.watch(studentProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: studentData.keys.map((studentId) {
        Map<String, dynamic> studentInfo = studentData[studentId]!;
        return CardView(
            studentName: studentInfo['studentname'],
            grade: studentInfo['standard'],
            school: studentInfo['schoolname']);
      }).toList()
          // CardView(),
          // SizedBox(
          //   width: 4,
          // ),
          // CardView(),
          // SizedBox(
          //   width: 4,
          // ),
          // CardView(),
          ),
    );
  }
}

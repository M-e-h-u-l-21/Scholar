class Student {
  late String name;
  late int standard;
  String verifiedBy = "";
  String verifiedOn = ""; //TODO : Fix the date
  bool isVerified = false;
  late String fathersName;
  late String fathersOccupation;
  late String mothersOccupation;
  late int annualIncome;
  late int numFamMembers;
  late String schoolName;
  // Income Certificate
  // Performance Proof
  // Certificates if any
  late int scholarNo;
  // Video of student
  late String address;
  late int stuContactNo;
  late int guardContactNo;

  Student(
      {required this.name,
      required this.standard,
      required this.fathersName,
      required this.fathersOccupation,
      required this.mothersOccupation,
      required this.annualIncome,
      required this.numFamMembers,
      required this.schoolName,
      required this.scholarNo,
      required this.address,
      required this.stuContactNo,
      required this.guardContactNo});
  Map<String, dynamic> toMap() {
    return {
      'studentname': name,
      'standard': standard,
      'fathersname': fathersName,
      'fathersoccupation': fathersOccupation,
      'mothersoccupation': mothersOccupation,
      'annualincome': annualIncome,
      'numfammembers': numFamMembers,
      'schoolname': schoolName,
      'scholarno': scholarNo,
      'address': address,
      'studentcontact': stuContactNo,
      'guardiancontact': guardContactNo
    };
  }
}

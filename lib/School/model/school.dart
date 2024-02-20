class School {
  late String schoolName;
  late String udiseCode;
  late String state;
  late String city;
  late String address;
  late int contactno;

  School(
      {required this.schoolName,
      required this.udiseCode,
      required this.state,
      required this.city,
      required this.address,
      required this.contactno});

  Map<String, dynamic> toMap() {
    return {
      'name': schoolName,
      'udiseCode': udiseCode,
      'address': address,
      'state': state,
      'city': city,
      'contactno': contactno,
      'students' : []
      // Add more fields as needed
    };
  }
}

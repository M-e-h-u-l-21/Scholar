class studentRequirement {
  final String title;
  final String amount;
  final String date;
  final String description;
  bool isFulfilled = false;

  studentRequirement(
      {required this.title,
      required this.amount,
      required this.date,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'date': description,
      'description': description,
      'isFulfilled' : false,
    };
  }
}

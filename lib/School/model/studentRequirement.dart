class studentRequirement {
  final String title;
  final int amount;
  final DateTime deadline;
  final String description;
  bool isFulfilled = false;

  studentRequirement(
      {required this.title,
      required this.deadline,
      required this.description,
      required this.amount});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'date': deadline,
      'description': description,
      'isFulfilled': false,
    };
  }
}

class FeeOption {
  late String month;
  late String percentage;
  late String amount;

  FeeOption(String month, String percentage, String amount) {
    this.amount = amount;
    this.month = month;
    this.percentage = percentage;
  }
}

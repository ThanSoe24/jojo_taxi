class TransactionModel {
  final String customer, refNo, status;
  final double paymentAmount;
  final DateTime dateTime;

  const TransactionModel(
      {required this.customer,
      required this.refNo,
      required this.status,
      required this.paymentAmount,
      required this.dateTime});
}

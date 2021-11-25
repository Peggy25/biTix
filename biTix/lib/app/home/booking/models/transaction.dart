import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String? userId;
  final String? titleMovie;
  final int? amount;
  final DateTime? time;
  final String? pictureMovie;
  final int? idTransaction;
  const TransactionModel({
    this.userId,
    this.titleMovie,
    this.amount,
    this.time,
    this.pictureMovie,
    this.idTransaction,
  });
  @override
  List<Object?> get props =>
      [userId, time, titleMovie, amount, pictureMovie, idTransaction];
}

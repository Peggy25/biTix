import 'package:equatable/equatable.dart';

class TicketTransaction extends Equatable {
  final String? movieId;
  final String? userId;
  final String? seats;
  final String? time;
  final String? bookingCode;
  final String? name;
  final int? total;
  final String? theaterName;
  final String? urlCover;
  const TicketTransaction({
    this.urlCover,
    this.movieId,
    this.userId,
    this.seats,
    this.time,
    this.bookingCode,
    this.name,
    this.total,
    this.theaterName,
  });
  @override
  List<Object?> get props =>
      [movieId, userId, seats, time, bookingCode, name, total, theaterName];
}

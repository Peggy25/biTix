import 'package:bitix/app/home/booking/models/theater.dart';
import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/app/home/movie/models/movie_detail.dart';
import 'package:equatable/equatable.dart';

class TicketModel extends Equatable {
  final MovieDetailModel? movieDetail;
  final MovieModel? movieModel;
  final TheaterModel? theater;
  final String? time;
  final String? bookingCode;
  final List<String>? seats;
  final String? name;
  final int? totalPrice;

  const TicketModel(
      {this.movieDetail,
      this.movieModel,
      this.theater,
      this.time,
      this.bookingCode,
      this.seats,
      this.name,
      this.totalPrice});

  String get seatsInString {
    String s = '';
    for (var seat in seats!) {
      s += seat + ((seat != seats!.last) ? ',' : '');
    }
    return s;
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieModel,
        theater,
        time,
        bookingCode,
        seats,
        name,
        totalPrice
      ];
}

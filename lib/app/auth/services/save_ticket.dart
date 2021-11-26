import 'package:bitix/app/home/ticket/models/ticket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference? _ticketCollect =
    FirebaseFirestore.instance.collection('tickets');
Future<void> saveTicket(String? id, TicketModel? ticketModel) async {
  await _ticketCollect!.doc(ticketModel!.bookingCode).set({
    'movieID': ticketModel.movieModel!.id,
    'userID': id,
    'urlCover': ticketModel.movieModel!.posterPath,
    'seats': ticketModel.seatsInString,
    'time': ticketModel.time,
    'bookingCode': ticketModel.bookingCode,
    'name': ticketModel.name,
    'total': ticketModel.totalPrice,
    'theaterName': ticketModel.theater!.name,
  });
}

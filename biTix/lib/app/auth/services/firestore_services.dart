import 'dart:math';

import 'package:bitix/app/auth/models/user.dart';
import 'package:bitix/app/home/booking/models/theater.dart';
import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/app/home/ticket/models/ticket.dart';
import 'package:bitix/app/home/ticket/models/ticket_transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  // create collection data firebase
  static CollectionReference? _userCollect =
      FirebaseFirestore.instance.collection('users');
  static CollectionReference? _ticketCollect =
      FirebaseFirestore.instance.collection('tickets');

  static Future<void> saveUser(Users? user) async {
    await _userCollect!.doc(user!.id).set({
      'email': user.email,
      'id': user.id,
      'name': user.name,
      'picturePath': user.profilePicture,
    }).then((value) {
      print('success');
    }).catchError((error) {
      print(error);
    });
  }

  static Future<void> saveTicket(String? id, TicketModel? ticketModel) async {
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

  static Future<List<TicketTransaction>?> getTicket(String? id) async {
    List<TicketTransaction> tickets = [];
    await _ticketCollect!.where('userID', isEqualTo: id).get().then((value) {
      for (var element in value.docs) {
        Map<String, dynamic> data = element.data()! as Map<String, dynamic>;
        tickets.add(TicketTransaction(
            urlCover: '${data['urlCover']}',
            bookingCode: '${data['bookingCode']}',
            movieId: '${data['movieID']}',
            name: '${data['name']}',
            seats: '${data['seats']}',
            theaterName: '${data['theaterName']}',
            time: '${data['time']}',
            total: data['total'] as int,
            userId: '${data['userID']}'));
      }
    });

    return tickets;
  }
}

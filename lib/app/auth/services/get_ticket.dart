import 'package:bitix/app/home/ticket/models/ticket_transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference? _ticketCollect =
    FirebaseFirestore.instance.collection('tickets');

Future<List<TicketTransaction>?> getTicket(String? id) async {
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

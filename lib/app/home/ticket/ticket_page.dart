import 'package:bitix/app/auth/models/user.dart';
import 'package:bitix/app/auth/services/get_ticket.dart';
import 'package:bitix/app/home/ticket/models/ticket_transaction.dart';
import 'package:bitix/app/home/ticket/widgets/card_ticket.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  List<TicketTransaction>? ticketTransaction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Ticket Page',
          style: fontStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FutureBuilder(
          future:getTicket('${dummyUser.id}'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // if error
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error} occured'),
                );
              }

              ticketTransaction = snapshot.data as List<TicketTransaction>;
              return ListView.builder(
                itemCount: ticketTransaction!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, (index == 0) ? 0 : 10, 0, 0),
                    child: CardTicket(
                      ticketTransaction: ticketTransaction![index],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorApp.darkColor),
              ),
            );
          },
        ),
      ),
    );
  }
}

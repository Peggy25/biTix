import 'package:bitix/app/home/ticket/models/ticket_transaction.dart';
import 'package:bitix/shared/end_point.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:flutter/material.dart';

class CardTicket extends StatelessWidget {
  final TicketTransaction? ticketTransaction;
  const CardTicket({Key? key, this.ticketTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(
                    EndPoint.posterImage + '${ticketTransaction!.urlCover}'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.5)
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    '${ticketTransaction!.bookingCode}',
                    overflow: TextOverflow.ellipsis,
                    style: fontStyle.copyWith(
                        color: Colors.white.withOpacity(0.5), fontSize: 30),
                    maxLines: 1,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    '${ticketTransaction!.time}',
                    overflow: TextOverflow.ellipsis,
                    style: fontStyle.copyWith(
                        color: Colors.white.withOpacity(0.5), fontSize: 10),
                    maxLines: 1,
                  ),
                ),
              ),

              /// show title movie
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  '${ticketTransaction!.theaterName}',
                  overflow: TextOverflow.ellipsis,
                  style: fontStyle.copyWith(color: Colors.white),
                  maxLines: 1,
                ),
              ),

              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${ticketTransaction!.seats}',
                        style: fontStyle.copyWith(
                            color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.chair,
                        color: Colors.yellow[700],
                        size: 13,
                      )
                    ],
                  ),
                ),
              )
              //
            ],
          ),
        ),
      ),
    );
  }
}

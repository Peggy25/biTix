import 'dart:math';

import 'package:bitix/app/auth/models/user.dart';
import 'package:bitix/app/auth/services/firestore_services.dart';
import 'package:bitix/app/home/booking/select_seat_and_date.dart';
import 'package:bitix/app/home/dashboard/dashboard_page.dart';

import 'package:bitix/app/home/ticket/models/ticket.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/end_point.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  final TicketModel? ticketModel;

  const CheckoutPage({Key? key, this.ticketModel}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total =
        widget.ticketModel!.theater!.price! * widget.ticketModel!.seats!.length;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
                builder: (_) => SelectSeatAndDate(
                      movieDetailModel: widget.ticketModel!.movieDetail,
                      movieModel: widget.ticketModel!.movieModel,
                      theaterModel: widget.ticketModel!.theater,
                    )));
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorApp.gray,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                      builder: (_) => SelectSeatAndDate(
                            movieDetailModel: widget.ticketModel!.movieDetail,
                            movieModel: widget.ticketModel!.movieModel,
                            theaterModel: widget.ticketModel!.theater,
                          )));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          title: Text(
            'Checkout',
            style: fontStyle,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(EndPoint.posterImage +
                                widget.ticketModel!.movieModel!.posterPath!),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * 20 -
                              120 -
                              10,
                          child: Text(
                            widget.ticketModel!.movieModel!.title!,
                            style:
                                fontStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * 20 -
                              120 -
                              10,
                          child: Text(
                            widget.ticketModel!.movieDetail!.genresAndLanguage,
                            style: fontStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ID Pemesanan',
                        style: fontStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.ticketModel!.bookingCode!,
                        style: fontStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bioskop',
                        style: fontStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.ticketModel!.theater!.name!,
                        style: fontStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal & Waktu',
                        style: fontStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.ticketModel!.time!,
                        style: fontStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nomor Bangku',
                        style: fontStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.ticketModel!.seatsInString,
                        style: fontStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Harga',
                        style: fontStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        NumberFormat.currency(
                                    locale: "id_ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(widget.ticketModel!.theater!.price) +
                            ' x ${widget.ticketModel!.seats!.length}',
                        style: fontStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: fontStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: "id_ID",
                                decimalDigits: 0,
                                symbol: "IDR ")
                            .format(total),
                        style: fontStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ButtonPrimary(
                    widthButton: 200,
                    textButton: 'Bayar',
                    onTap: () {
                      var random = Random();
                      var generateId = random.nextInt(1000000);
                      FirestoreServices.saveTicket(
                              dummyUser.id,
                              TicketModel(
                                  name: widget.ticketModel!.movieModel!.title,
                                  bookingCode: generateId.toString(),
                                  seats: widget.ticketModel!.seats,
                                  time: widget.ticketModel!.time,
                                  theater: widget.ticketModel!.theater,
                                  movieModel: widget.ticketModel!.movieModel,
                                  totalPrice:
                                      (widget.ticketModel!.theater!.price! *
                                          widget.ticketModel!.seats!.length)))
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          'Berhasil membeli tiket',
                          style: fontStyle.copyWith(color: Colors.white),
                        )));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (_) => const DashboardPage()));
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          'Gagal membeli ticket',
                          style: fontStyle.copyWith(color: Colors.white),
                        )));
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

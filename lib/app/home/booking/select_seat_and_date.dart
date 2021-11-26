import 'dart:math';

import 'package:bitix/app/auth/models/user.dart';
import 'package:bitix/app/home/booking/models/theater.dart';
import 'package:bitix/app/home/booking/select_teather_page.dart';
import 'package:bitix/app/home/booking/widgets/box_selected.dart';
import 'package:bitix/app/home/checkout/checkout_page.dart';
import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/app/home/movie/models/movie_detail.dart';
import 'package:bitix/app/home/ticket/models/ticket.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/widgets/button_primary.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class SelectSeatAndDate extends StatefulWidget {
  final TheaterModel? theaterModel;
  final MovieDetailModel? movieDetailModel;
  final MovieModel? movieModel;
  const SelectSeatAndDate(
      {Key? key, this.theaterModel, this.movieDetailModel, this.movieModel})
      : super(key: key);

  @override
  _SelectSeatAndDateState createState() => _SelectSeatAndDateState();
}

class _SelectSeatAndDateState extends State<SelectSeatAndDate> {
  List<String> selectedOfSeats = [];
  String selectedDate = DateTime.now().toString();
  String selectedTime = "";
  List<String> timeSelect = [
    "10:00",
    "12:00",
    "14:00",
    "16:00",
    "19:00",
    "21:00"
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
                builder: (_) => SelectTeatherPage(
                      movieDetailModel: widget.movieDetailModel,
                      movieModel: widget.movieModel,
                    )));
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Pilih Tanggal dan Kursi',
              style: fontStyle,
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                        builder: (_) => SelectTeatherPage(
                              movieModel: widget.movieModel,
                              movieDetailModel: widget.movieDetailModel,
                            )));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Pilih Tanggal',
                    style: fontStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DateTimePicker(
                    dateMask: 'd MMM, yyyy',
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: const Icon(Icons.event),
                    dateLabelText: 'Date',
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorApp.darkColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorApp.darkColor,
                                style: BorderStyle.solid))),
                    // selectableDayPredicate: (date) {
                    //   // Disable weekend days to select from the calendar
                    //   if (date.weekday == 6 || date.weekday == 7) {
                    //     return false;
                    //   }

                    //   return true;
                    // },
                    onChanged: (val) => selectedDate = val,
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => selectedDate = val!,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Pilih Waktu',
                    style: fontStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: timeSelect
                          .map((e) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (e == timeSelect.first) ? 0 : 10, 0, 0, 0),
                                child: BoxSelected(
                                  onTap: () {
                                    setState(() {
                                      selectedTime = e;
                                    });
                                  },
                                  isEnabled: selectedTime == e,
                                  isSelected: selectedTime == e,
                                  width: 100,
                                  text: e,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 2,
                    color: ColorApp.darkColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Layar Bioskop',
                      style: fontStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  generateSeats(),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ButtonPrimary(
                      widthButton: 200,
                      onTap: () {
                        var random = Random();

                        var kode = random.nextInt(10000000);
                        if (selectedOfSeats.isEmpty || selectedTime == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            'Harus Di isi semua',
                            style: fontStyle.copyWith(color: Colors.white),
                          )));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (_) => CheckoutPage(
                                        ticketModel: TicketModel(
                                            name: dummyUser.name,
                                            bookingCode: kode.toString(),
                                            movieDetail:
                                                widget.movieDetailModel,
                                            movieModel: widget.movieModel,
                                            seats: selectedOfSeats,
                                            theater: widget.theaterModel,
                                            time: selectedDate +
                                                ", " +
                                                selectedTime),
                                      )));
                        }
                      },
                      textButton: 'Checkout',
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Column generateSeats() {
    List<int> numberofSeats = [6, 6, 6, 6, 6, 6];
    List<Widget> widgets = [];
    for (int i = 0; i < numberofSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            numberofSeats[i],
            (index) => Padding(
                  padding: EdgeInsets.only(
                      right: index < numberofSeats[i] - 1 ? 16 : 0, bottom: 16),
                  child: BoxSelected(
                    text: "${String.fromCharCode(i + 65)}${index + 1}",
                    isEnabled: true,
                    width: 40,
                    height: 40,
                    textStyle: fontStyle.copyWith(color: Colors.black),
                    isSelected: selectedOfSeats
                        .contains("${String.fromCharCode(i + 65)}${index + 1}"),
                    onTap: () {
                      String seatNumber =
                          "${String.fromCharCode(i + 65)}${index + 1}";
                      setState(() {
                        if (selectedOfSeats.contains(seatNumber)) {
                          selectedOfSeats.remove(seatNumber);
                        } else {
                          selectedOfSeats.add(seatNumber);
                        }
                      });
                    },
                  ),
                )),
      ));
    }
    return Column(
      children: widgets,
    );
  }
}

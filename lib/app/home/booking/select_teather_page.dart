import 'package:bitix/app/home/booking/models/theater.dart';
import 'package:bitix/app/home/booking/select_seat_and_date.dart';
import 'package:bitix/app/home/booking/widgets/select_box.dart';
import 'package:bitix/app/home/movie/detail_movie_page.dart';
import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/app/home/movie/models/movie_detail.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:flutter/material.dart';

class SelectTeatherPage extends StatefulWidget {
  final MovieDetailModel? movieDetailModel;
  final MovieModel? movieModel;
  const SelectTeatherPage({Key? key, this.movieDetailModel, this.movieModel})
      : super(key: key);

  @override
  _SelectTeatherPageState createState() => _SelectTeatherPageState();
}

class _SelectTeatherPageState extends State<SelectTeatherPage> {
  int? selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
                builder: (_) => DetailMoviePage(
                      isNowPlaying: true,
                      model: widget.movieModel,
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
                      builder: (_) => DetailMoviePage(
                            model: widget.movieModel!,
                          )));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          title: Text(
            'Pilih Bioskop',
            style: fontStyle,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: dummyTheater.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, (index == 0) ? 20 : 10, 0, 0),
                child: SelectBox(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                            builder: (_) => SelectSeatAndDate(
                                  movieModel: widget.movieModel,
                                  movieDetailModel: widget.movieDetailModel,
                                  theaterModel: dummyTheater[index],
                                )));
                  },
                  title: dummyTheater[index].name,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:bitix/app/auth/models/user.dart';
import 'package:bitix/app/home/movie/detail_movie_page.dart';
import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/app/home/movie/services/coming_soon.dart';
import 'package:bitix/app/home/movie/services/now_playing.dart';
import 'package:bitix/app/home/movie/widgets/movie_card.dart';
import 'package:bitix/app/home/profile/profile_page.dart';
import 'package:bitix/app/intro/intro_pages.dart';
import 'package:bitix/shared/assets.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<MovieModel>? movieNowPlaying;
  List<MovieModel>? movieUpComing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.gray,
      body: SafeArea(
        child: Column(
          children: [
            /// app bar
            const CustomAppBar(),

            /// end app bar
            ///
            /// expand column
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///
                    /// text heading
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        'Sedang Tayang',
                        style: fontStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),

                    /// end text
                    ///
                    /// space height
                    const SizedBox(
                      height: 10,
                    ),

                    /// end space
                    /// space height
                    /// for show data movie now playing
                    SizedBox(
                        height: 200,
                        child: FutureBuilder(
                          future: getNowPlaying(),
                          builder: (context, snapshot) {
                            movieNowPlaying =
                                snapshot.data as List<MovieModel>?;
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              // if error
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('${snapshot.error} occured'),
                                );
                              }

                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: movieNowPlaying!.length,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        (index == 0) ? 20 : 10,
                                        0,
                                        (index == movieNowPlaying!.length - 1)
                                            ? 20
                                            : 0,
                                        0),
                                    child: MovieCard(
                                        width: 300,
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute<void>(
                                                  builder: (_) =>
                                                      DetailMoviePage(
                                                        isNowPlaying: true,
                                                        model: movieNowPlaying![
                                                            index],
                                                      )));
                                        },
                                        model: movieNowPlaying![index]),
                                  );
                                },
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    ColorApp.darkColor),
                              ),
                            );
                          },
                        )),

                    /// end space
                    ///
                    /// text heading
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Segera Tayang',
                        style: fontStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),

                    /// end text
                    ///
                    SizedBox(
                        height: 200,
                        child: FutureBuilder(
                          future: getUpcoming(),
                          builder: (context, snapshot) {
                            movieUpComing = snapshot.data as List<MovieModel>?;
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              // if error
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('${snapshot.error} occured'),
                                );
                              }

                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: movieUpComing!.length,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        (index == 0) ? 20 : 10,
                                        0,
                                        (index == movieUpComing!.length - 1)
                                            ? 20
                                            : 0,
                                        0),
                                    child: MovieCard(
                                        width: 130,
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute<void>(
                                                  builder: (_) =>
                                                      DetailMoviePage(
                                                        isNowPlaying: false,
                                                        model: movieUpComing![
                                                            index],
                                                      )));
                                        },
                                        model: movieUpComing![index]),
                                  );
                                },
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    ColorApp.darkColor),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
            )

            /// end expand
            ///
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // custom appbar
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      height: 120,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// name and wallet amount
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  dummyUser.name!,
                  style: fontStyle.copyWith(
                      fontSize: 13, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: 150,
                child: Text(
                  NumberFormat.currency(
                          locale: "id_ID", decimalDigits: 0, symbol: "IDR ")
                      .format(dummyUser.balance),
                  style: fontStyle.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.green),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                ),
              ),
            ],
          ),

          ///
          /// image profile
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute<void>(builder: (_) => const ProfilePage()));
            },
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(ImageApp.get(ImageApp.img_user_pic)),
                    fit: BoxFit.cover),
              ),
            ),
          ),

          /// end image profile
        ],
      ),
    );
    // end appbar;
  }
}

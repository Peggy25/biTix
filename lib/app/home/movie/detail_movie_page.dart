import 'package:bitix/app/home/booking/select_teather_page.dart';
import 'package:bitix/app/home/dashboard/dashboard_page.dart';
import 'package:bitix/app/home/movie/models/credits.dart';
import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/app/home/movie/models/movie_detail.dart';
import 'package:bitix/app/home/movie/services/credits_movie.dart';
import 'package:bitix/app/home/movie/services/detail_movie.dart';
import 'package:bitix/app/home/movie/widgets/credit_image.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/end_point.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({Key? key, this.model, this.isNowPlaying})
      : super(key: key);
  final MovieModel? model;
  final bool? isNowPlaying;
  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  MovieDetailModel? movieDetail;
  List<CreditsModel>? credits;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute<void>(builder: (_) => const DashboardPage()));
        return true;
      },
      child: Scaffold(
          backgroundColor: ColorApp.gray,
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxScroller) {
                return [
                  /// sliver app bar
                  SliverAppBar(
                    expandedHeight: 260,
                    pinned: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (_) => const DashboardPage()));
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    title: Text(
                      widget.model!.title!,
                      style: fontStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    backgroundColor: ColorApp.darkColor,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Stack(
                        children: [
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        EndPoint.backCoverImage +
                                            widget.model!.backdropPath!),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: const Alignment(0, 1),
                                    end: const Alignment(0, 0.06),
                                    colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0)
                                ])),
                          )
                        ],
                      ),
                    ),
                  )

                  /// end sliver app bar
                  ///
                ];
              },
              body: FutureBuilder(
                future: getDetailMovie(widget.model, idMovie: widget.model!.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error} occured'),
                      );
                    }
                    if (snapshot.hasData) {
                      movieDetail = snapshot.data as MovieDetailModel;
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 * 20,
                              child: Text(
                                widget.model!.title!,
                                maxLines: 2,
                                style: fontStyle.copyWith(fontSize: 15),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Center(
                              child: Text(
                                movieDetail!.genresAndLanguage,
                                style: fontStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${widget.model!.voteAverage}',
                                    style: fontStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[700],
                                    size: 13,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Credits',
                                style: fontStyle.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                                height: 100,
                                child: FutureBuilder(
                                  future: getCredits(widget.model!.id!),
                                  builder: (context, snapshotCredit) {
                                    credits = snapshotCredit.data
                                        as List<CreditsModel>?;
                                    if (snapshotCredit.connectionState ==
                                        ConnectionState.done) {
                                      // if error
                                      if (snapshotCredit.hasError) {
                                        return Center(
                                          child: Text(
                                              '${snapshotCredit.error} occured'),
                                        );
                                      }

                                      return ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: credits!.length,
                                        itemBuilder: (ctx, indexCredit) {
                                          return Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                (indexCredit == 0) ? 20 : 10,
                                                0,
                                                (indexCredit ==
                                                        credits!.length - 1)
                                                    ? 20
                                                    : 0,
                                                0),
                                            child: CreditImages(
                                              creditsModel:
                                                  credits![indexCredit],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                ColorApp.darkColor),
                                      ),
                                    );
                                  },
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Overview',
                                style: fontStyle.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                widget.model!.overview!,
                                style: fontStyle.copyWith(fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Visibility(
                                visible: widget.isNowPlaying! ? true : false,
                                child: ButtonPrimary(
                                  heightButton: 50,
                                  widthButton: 250,
                                  textButton: 'Beli Tiket',
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (_) => SelectTeatherPage(
                                                  movieDetailModel: movieDetail,
                                                  movieModel: widget.model,
                                                )));
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(ColorApp.darkColor),
                    ),
                  );
                },
              ))),
    );
  }
}

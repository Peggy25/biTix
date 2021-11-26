import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/shared/end_point.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, this.model, this.onTap, this.width = 140, this.height = 70}) : super(key: key);
  final MovieModel? model;
  final Function? onTap;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap != null){
          onTap!();
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: 
          /// show image cover
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(EndPoint.posterImage + model!.posterPath!),
                fit: BoxFit.cover),
          ),
          child: 
          /// create gradient
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.61),
                  Colors.black.withOpacity(0)
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// show title movie
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    model!.title!,
                    overflow: TextOverflow.ellipsis,
                    style: fontStyle.copyWith(color: Colors.white),
                    maxLines: 1,
                  ),
                ),
                /// show vote average movie
                Container(
                  padding:
                      const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${model!.voteAverage!}',
                        style: fontStyle.copyWith(color: Colors.white,fontSize: 12),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                        size: 13,
                      )
                    ],
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

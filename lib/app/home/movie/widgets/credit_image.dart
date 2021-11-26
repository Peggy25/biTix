import 'package:bitix/app/home/movie/models/credits.dart';
import 'package:bitix/shared/assets.dart';
import 'package:bitix/shared/end_point.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CreditImages extends StatelessWidget {
  const CreditImages({
    Key? key,
    this.creditsModel,
  }) : super(key: key);
  final CreditsModel? creditsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(ImageApp.get(ImageApp.img_user_pic)),
                    fit: BoxFit.contain))),
        placeholder: (context, url) => Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.61),
                  Colors.black.withOpacity(0)
                ],
              ),
            )),
        imageUrl: EndPoint.creditsImage + creditsModel!.profile_path!,
        imageBuilder: (context, imageProvider) => Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

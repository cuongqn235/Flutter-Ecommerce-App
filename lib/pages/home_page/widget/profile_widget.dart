import 'package:bandongho/model/profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../values/app_convert.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.height, required this.profile});
  final double height;
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      padding: const EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(children: [
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ClipOval(
              child: CachedNetworkImage(
            imageUrl: profile.image ??
                'https://clementjames.org/wp-content/uploads/2019/09/avatar-1577909_960_720-1.png',
            fit: BoxFit.fill,
            errorWidget: (context, url, error) {
              return CachedNetworkImage(
                imageUrl:
                    'https://clementjames.org/wp-content/uploads/2019/09/avatar-1577909_960_720-1.png',
                fit: BoxFit.fill,
              );
            },
          )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${profile.firstName} ${profile.lastName}',
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('${profile.email}',
                maxLines: 2,
                style: const TextStyle(fontSize: 13, color: Colors.grey)),
            const SizedBox(
              height: 10,
            ),
            Text('${profile.gender}',
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: Colors.grey)),
            const SizedBox(
              height: 10,
            ),
            Text(
                '${AppConvert.dateFormat(profile.birthday ?? '1961-10-17 16:37:57.686')}',
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: Colors.grey))
          ],
        )
      ]),
    );
  }
}

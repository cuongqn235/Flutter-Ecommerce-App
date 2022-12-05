import 'package:bandongho/model/result_profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      padding: EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(children: [
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(profile.image == ''
                      ? 'https://clementjames.org/wp-content/uploads/2019/09/avatar-1577909_960_720-1.png'
                      : profile.image),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(50),
              border:
                  Border.all(width: 2, color: Color.fromRGBO(12, 27, 50, 1))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${profile.firstName} ${profile.lastName}',
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('${profile.email}',
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: Colors.grey)),
            SizedBox(
              height: 10,
            ),
            Text('${profile.gender}',
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: Colors.grey)),
            SizedBox(
              height: 10,
            ),
            Text('${AppConvert.dateFormat(profile.birthday)}',
                maxLines: 2, style: TextStyle(fontSize: 13, color: Colors.grey))
          ],
        )
      ]),
    );
  }
}

import 'package:bandongho/pages/home_page/widget/profile_widget.dart';
import 'package:bandongho/pages/profile_page/profile_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/result_user_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late ResultUserProvider prov;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prov = Provider.of<ResultUserProvider>(context, listen: false);
    prov.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Consumer<ResultUserProvider>(
        builder: (context, value, child) {
          return value.loading
              ? Center(
                  child: LoadingAnimationWidget.discreteCircle(
                      color: Colors.amber, size: 50))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      ProfileWidget(
                          height: 180, profile: prov.resultProfile.data),
                      ItemDraw(
                        'Profile',
                        Icons.home,
                        () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                  profile: prov.resultProfile.data,
                                ),
                              ));
                        },
                      ),
                      ItemDraw(
                          'My orders', Icons.sensor_occupied_rounded, () {}),
                      ItemDraw('Favorites', Icons.favorite, () {}),
                      ItemDraw('Delivery', Icons.card_travel, () async {}),
                      ItemDraw('Settings', Icons.settings, () {}),
                      Spacer(),
                      ItemDraw('Sign Out', Icons.logout, () async {
                        await prov.signOut().then((value) {
                          if (value == '') {
                            Navigator.pushNamedAndRemoveUntil(context, '/login',
                                (Route<dynamic> route) => false);
                          }
                        });
                      })
                    ]);
        },
      ),
    );
  }

  Widget ItemDraw(String tittle, IconData iconItemDraw, Function funcOntap) {
    return InkWell(
      onTap: () => funcOntap(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Row(
          children: [
            Icon(
              iconItemDraw,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              tittle,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

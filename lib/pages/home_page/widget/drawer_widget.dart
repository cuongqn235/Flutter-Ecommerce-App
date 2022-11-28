import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/result_user_provider.dart';
import 'item_draw_home_page.dart';

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
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(children: [
            Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(right: 20),
              child: ClipOval(
                child: Image.network(
                  prov.resultProfile.data.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${prov.resultProfile.data.firstName} ${prov.resultProfile.data.lastName}',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('${prov.resultProfile.data.email}',
                    maxLines: 2,
                    style: TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            )
          ]),
        ),
        ItemDraw(
          tittle: 'Profile',
          iconItemDraw: Icons.home,
          funcOntap: () {},
        ),
        ItemDraw(
            tittle: 'My orders',
            iconItemDraw: Icons.sensor_occupied_rounded,
            funcOntap: () {}),
        ItemDraw(
            tittle: 'Favorites',
            iconItemDraw: Icons.favorite,
            funcOntap: () {}),
        ItemDraw(
            tittle: 'Delivery',
            iconItemDraw: Icons.card_travel,
            funcOntap: () async {}),
        ItemDraw(
            tittle: 'Settings', iconItemDraw: Icons.settings, funcOntap: () {}),
        Spacer(),
        ItemDraw(
            tittle: 'Sign Out', iconItemDraw: Icons.logout, funcOntap: () {})
      ]),
    );
  }
}

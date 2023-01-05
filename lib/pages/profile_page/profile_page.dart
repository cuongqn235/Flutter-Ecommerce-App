import 'dart:io';

import 'package:bandongho/values/app_convert.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../model/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.profile});
  final Profile profile;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController firstNameTextController = TextEditingController();
  String temp = '';
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    this.image = imageTemp;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              Container(
                height: size.height / 2 - 150,
                width: size.width,
                color: Color.fromRGBO(12, 27, 50, 1),
                child: Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(12, 27, 50, 1))),
                          child: ClipOval(
                              child: CachedNetworkImage(
                            imageUrl: widget.profile.image ??
                                'https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-1-480x600.jpg',
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                              onPressed: pickImage,
                              icon: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              ),
                            ))
                      ]),
                      Text(
                        '${widget.profile.firstName} ${widget.profile.lastName}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                          AppConvert.dateFormat(widget.profile.birthday ??
                              '1961-10-17 16:37:57.686'),
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: widget.profile.firstName,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'First name',
                        labelText: 'First name',
                      ),
                      onSaved: (String? value) {
                        print(value);
                      },
                      validator: (String? value) {
                        return (temp != null && temp.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                      onChanged: (value) {
                        setState(() {
                          temp = value;
                        });
                      },
                    ),
                    TextFormField(
                      initialValue: widget.profile.lastName,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Last name',
                        labelText: 'Last name',
                      ),
                      onSaved: (String? value) {
                        print(value);
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    TextFormField(
                      initialValue: widget.profile.email,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                      onSaved: (String? value) {
                        print(value);
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonProfile(String tittel, Function ontap) {
    return Ink(
      height: 40,
      decoration: BoxDecoration(),
    );
  }
}

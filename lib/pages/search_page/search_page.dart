import 'package:bandongho/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // SearchProvider prov = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Search Shoes...",
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
            onChanged: (value) {
              print(_controller.text);
            },
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}

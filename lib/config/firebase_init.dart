import 'package:bandongho/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// tìm hiểu thêm về firestore
class FirebaseInit extends StatefulWidget {
  const FirebaseInit({super.key, required this.child});
  final Widget child;
  @override
  State<FirebaseInit> createState() => _FirebaseInitState();
}

class _FirebaseInitState extends State<FirebaseInit> {
  final Future<FirebaseApp> _firebaseinit = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseinit,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Center(
            child: Text("error: ${snapshot.error}"),
          );
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.child;
        }
        return CircularProgressIndicator();
      },
    );
  }
}

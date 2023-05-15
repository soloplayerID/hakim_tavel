// ignore_for_file: must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hakim_travel/routes/routes.dart';

import 'firebase_options.dart';
import 'parent/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var appState = AppState(0);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      data: appState,
      child: MaterialApp(
        title: 'Hakim Travel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'SFProDisplay',
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: routes,
      ),
    );
  }
}

class AppState extends ValueNotifier {
  AppState(value) : super(value);
}

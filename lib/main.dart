import 'package:aa/models/person.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:aa/pages/animation_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(PersonAdapter());
  // Opening the box
  await Hive.openBox('peopleBox');




  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(



    options: FirebaseOptions(
      apiKey:"AIzaSyBehzT-i2JIrVmy8NZ1DOegc5ynNaN7cFg",
      appId:"mobilbut",
      messagingSenderId:"125465620002",
      projectId:"mobilbut-cce32",
      storageBucket:""
    )
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splashscreen(),
    );
  }
}


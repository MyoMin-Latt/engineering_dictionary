// @1 Engineering Dictionary Demo Application
// @2 Engineering Dictionary Dependency and Database File
// @17.3 Create Table for dictionary app
// @17.4 Creating database file
// @17.5 Create Database Class
// @17.6 Dictionary Dao
// @17.7 Connect Dictionary Database
// @17.9 Dictionary search UI


import 'package:a17_eng_dictionary/database/dictionary_database.dart';
import 'package:a17_eng_dictionary/screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'database/dictionary_dao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'database/db_helper.dart';
import 'form_kontak.dart';
import 'list_kontak.dart';
import 'model/kontak.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ListKontakPage(),
    );
  }
}
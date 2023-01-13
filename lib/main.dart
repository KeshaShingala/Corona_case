
import 'package:corona_case/scrrens/Homepage.dart';
import 'package:corona_case/scrrens/secondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const Homepage(),
        'secondpage' : (context) => const secondpage(),
      },
    ),
  );
}

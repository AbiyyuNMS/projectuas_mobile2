import 'package:flutter/material.dart';
import 'package:prj_uas223_d1_24/shared/style_text.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({super.key});

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Text(
          "SearchPage",
          style: styleapp(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
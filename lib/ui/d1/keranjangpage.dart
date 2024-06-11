import 'package:flutter/material.dart';
import 'package:prj_uas223_d1_24/shared/style_text.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Text(
          "CartPage",
          style: styleapp(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
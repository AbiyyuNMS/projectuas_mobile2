import 'package:flutter/material.dart';
import 'package:prj_uas223_d1_24/shared/style_text.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key, this.onTap, required this.label,
  });
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(11))),
          height: 40,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: Text(
              label,
              style: styleapp(20, Colors.white, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

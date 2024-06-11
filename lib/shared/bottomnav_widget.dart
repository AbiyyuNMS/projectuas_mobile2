import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';

class BottomNavwdg extends StatelessWidget {
  const BottomNavwdg({
    super.key,
    this.onTap,
    this.icon,
  });

  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 35,
        width: 35,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

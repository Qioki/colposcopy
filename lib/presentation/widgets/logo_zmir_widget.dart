import 'package:flutter/material.dart';

class LogoZmirWidget extends StatelessWidget {
  const LogoZmirWidget(this.width, {super.key});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_icon.png',
      width: width,
      filterQuality: FilterQuality.high,
    );
  }
}

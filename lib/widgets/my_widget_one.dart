import 'package:flutter/material.dart';

class MyWidgetOne extends StatelessWidget {
  final Color? bgColor;
  final Image? image;
  Widget? label;
  VoidCallback? onPress;

  MyWidgetOne(
      {super.key,
      this.bgColor,
      this.image,
      required this.label,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      child: ListTile(
        leading: image,
        title: label,
        onTap: onPress,
      ),
    );
  }
}

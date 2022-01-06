import 'package:flutter/material.dart';

class PrecentageBarIndicator extends StatelessWidget {
  final double precentage;
  final double height;
  final double width;

  const PrecentageBarIndicator({
    required this.height,
    required this.width,
    required this.precentage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            height: 90,
            width: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.purple,
            ),
            height: 50,
            width: 15,
          ),
        ],
      ),
    );
  }
}

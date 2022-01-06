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
              borderRadius: BorderRadius.circular(width / 2),
              color: Colors.grey[200],
            ),
            height: height,
            width: width,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: precentage < 0.95
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(width / 2),
                      bottomRight: Radius.circular(width / 2),
                    )
                  : BorderRadius.circular(width / 2),
              color: Colors.purple,
            ),
            height: height * precentage,
            width: width,
          ),
        ],
      ),
    );
  }
}

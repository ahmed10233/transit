import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_one/views/BusTimetableView.dart';

import '../views/BusTimeView.dart';

class ServiceWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String svg;
  final bool isRight;

  final bool isTop;
  final bool isDown;

  const ServiceWidget(
      {super.key,
      required this.color,
      required this.title,
      required this.subtitle,
      required this.svg,
      this.isRight = true,
      this.isTop = true,
      this.isDown = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BusTimeView(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 185,
            width: 185,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius of the shadow
                  blurRadius: 10, // Blur radius of the shadow
                  offset: Offset(0, 4), // Offset of the shadow (x, y)
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  SvgPicture.asset(
                    svg, // Load the SVG asset
                    height: 30, // Set the desired height for the SVG
                    color: color,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      fontFamily: 'Jost',
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Jost',
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      'assets/arrow.svg', // Load the SVG asset
                      height: 13, // Set the desired height for the SVG
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: isRight ? 0 : null,
            //change position num 1
            left: isRight ? null : 0,

            top: isTop ? 0 : null,
            // change position num 2
            bottom: isTop ? null : 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topRight: isTop
                      ? (isRight ? Radius.circular(20) : Radius.circular(0))
                      : Radius.circular(30),
                  topLeft: isTop
                      ? (isRight ? Radius.circular(0) : Radius.circular(20))
                      : Radius.circular(0),
                  // change shape num1

                  bottomRight: isTop
                      ? (isRight ? Radius.circular(0) : Radius.circular(30))
                      : Radius.circular(0),
                  // change shape num2
                  bottomLeft: isTop
                      ? (isRight ? Radius.circular(30) : Radius.circular(0))
                      : Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

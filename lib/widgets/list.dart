import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TimeList extends StatelessWidget {
  final String time;
  

  const TimeList({super.key, required this.time, }); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.red, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Container(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.bus_time,
                  style: TextStyle(
                    color: Color(0xffAAAAAA),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                 ), 
                  // SizedBox(height: 10,),
                
                Text(
                  "  ( $time )", // Display the time passed as a parameter
                  style: TextStyle(
                    color: Color(0xffFFFF7023),
                    fontWeight: FontWeight.w500,
                    fontFamily: "jost",
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}



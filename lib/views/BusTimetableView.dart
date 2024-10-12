// import 'package:flutter/material.dart';
// import 'package:task_one/widgets/Button.dart';
// import 'package:task_one/widgets/TimeTable.dart';

// class BusTimetableView extends StatelessWidget {
//   const BusTimetableView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         foregroundColor: Color(0xffFFFF7023),
//         backgroundColor: Colors.white,
//         title: Text(
//           "Bus",
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Bus Timetable",
//               style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xffFFFF7023),
//                   fontSize: 26),
//             ),
//             Text(
//               "Showing Bus Time Schedule",
//               style: TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.normal,
//                   fontSize: 20),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Starting Locations",
//               style: TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.normal,
//                   fontSize: 16),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CustomButton(
//                     buttonText: "Sheration",
//                     buttonColor: Color(0xffFFFF7023),
//                     textColor: Colors.white,
//                     horizontal: 20,
//                     vertical: 5),
//                 CustomButton(
//                     buttonText: "Sheration",
//                     buttonColor: Color(0xffFFFFDCC9),
//                     textColor: Color(0xffFFFF7023),
//                     horizontal: 20,
//                     vertical: 5),
//               ],
//             ),
//             Text(
//               'Bus Timeline',
//               style: TextStyle(
//                 color: Colors.grey, // Text color
//                 fontSize: 16, // Text size
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CustomButton(
//                     buttonText: "W1_01",
//                     buttonColor: Color(0xffFFFF7023),
//                     textColor: Colors.white,
//                     horizontal: 20,
//                     vertical: 5),
//                 CustomButton(
//                     buttonText: "W1_02",
//                     buttonColor: Color(0xffFFFF7023),
//                     textColor: Colors.white,
//                     horizontal: 15,
//                     vertical: 3),
//                 CustomButton(
//                     buttonText: "W1_03",
//                     buttonColor: Color(0xffFFFF7023),
//                     textColor: Colors.white,
//                     horizontal: 15,
//                     vertical: 3),
//                 CustomButton(
//                     buttonText: "W1_04",
//                     buttonColor: Color(0xffFFFF7023),
//                     textColor: Colors.white,
//                     horizontal: 15,
//                     vertical: 3),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomButton(
//                     buttonText: "6:30 am",
//                     buttonColor: Color(0xffFFFF7023),
//                     textColor: Colors.white,
//                     horizontal: 15,
//                     vertical: 3),
//                 TimeTable(),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomButton(
//                     buttonText: "6:30 am",
//                     buttonColor: Color(0xffFFFF7023),
//                     textColor: Colors.white,
//                     horizontal: 15,
//                     vertical: 3),
//                 TimeTable(),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomButton(
//                     buttonText: "6:30 am",
//                     buttonColor: Color(0xffFFFF7023),
//                     textColor: Colors.white,
//                     horizontal: 15,
//                     vertical: 3),
//                 TimeTable(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

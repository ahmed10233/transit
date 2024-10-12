import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/views/serviceView.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubits/lang_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffFF6E6AFF),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.elliptical(350, 120),
              bottomRight: Radius.elliptical(350, 120),
            ),
            child: Container(
              height: height * 0.91,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'W U F',
                            style: TextStyle(
                              color: Color(0xffFF7023),
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          Text(
                            'WORLD',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            'URBAN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            'FORUM',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Image.asset(
                        'assets/icon.png',
                        height: height * 0.23,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<LangCubit>().mainlanEN();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFF7023),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 10),
                        ),
                        child: Text(
                          'English',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<LangCubit>().mainlanAR();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 5),
                          side: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'العربية',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceView()),
                      );
                    },
                    child: Container(
                      width: 370,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xffFF7023),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.proceed,
                              style: TextStyle(
                                color: const Color(0xffFF7023),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Jost',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServiceView()),
                              );
                            },
                            icon: Icon(Icons.arrow_forward),
                            color: const Color(0xffFF7023),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.15), // Spacer to push content up
                ],
              ),
            ),
          ),
          PositionedDirectional(
            top: MediaQuery.of(context).size.height * 0.93,
            child: Container(
              child: Row(
                children: [
                  Image.asset(
                    "assets/home.png",
                    height: 40,
                  ),
                  const SizedBox(width: 5), // Space between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Aligns all children to the left
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Trans-IT',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Jost',
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.transit,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Jost',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

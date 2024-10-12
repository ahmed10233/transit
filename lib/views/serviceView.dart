import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/widgets/ServiceWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../cubits/lang_cubit.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFF6E6AFF), // You can set the color as needed
        title: GestureDetector(
          onTap: () {
            // Check the current language from AppLocalizations
            if (AppLocalizations.of(context)!.en == "EN") {
              // If the language is English, switch to Arabic
              context.read<LangCubit>().mainlanAR();
            } else {
              // If the language is Arabic, switch to English
              context.read<LangCubit>().mainlanEN();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.language,
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Text(
                AppLocalizations.of(context)!.en,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            // This will take all the available space
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(430, 250),
                    bottomRight: Radius.elliptical(430, 250),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    color: Color(0xffFF6E6AFF),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                AppLocalizations.of(context)!.hello_there,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  // Medium weight
                                  fontFamily: 'Jost',
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "!",
                                style: TextStyle(
                                  color: Color(0xffFFDC93),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                AppLocalizations.of(context)!.dear_gust,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.w300, // Light weight
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          ServiceWidget(
                            isDown: false,
                            isRight: true,
                            isTop: true,
                            svg: 'assets/bus.svg',
                            title: AppLocalizations.of(context)!.bus_time,
                            subtitle: AppLocalizations.of(context)!.time_info,
                            color: Color(0xffFFFF7023),
                          ),
                          SizedBox(height: 20),
                          ServiceWidget(
                            isDown: false,
                            isRight: false,
                            isTop: true,
                            svg: 'assets/bus.svg',
                            title: AppLocalizations.of(context)!.show_map,
                            subtitle: AppLocalizations.of(context)!.map_info,
                            color: Color(0xffFFEACD91),
                          )
                        ],
                      ),
                      ServiceWidget(
                        isDown: true,
                        isRight: false,
                        isTop: false,
                        svg: 'assets/touristic.svg',
                        title: AppLocalizations.of(context)!.touristic_sites,
                        subtitle: AppLocalizations.of(context)!.tour_info,
                        color: Color(0xffFF6E6AFF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Color(0xffFFEEEEEE),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.trans,
                style: TextStyle(
                  color: Color(0xffFFA2A2A2),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Jost',
                ),
              ),
              Image.asset(
                "assets/Logo TransIT.png",
              )
            ],
          ),
        ),
      ),
    );
  }
}

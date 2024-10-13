import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_one/cubits/get_data_cubit.dart';
import 'package:task_one/models/BusModel.dart';
import '../widgets/TimeTable.dart';

class BusTimeView extends StatefulWidget {
  const BusTimeView({super.key});

  @override
  State<BusTimeView> createState() => _BusTimeViewState();
}

class _BusTimeViewState extends State<BusTimeView> {
  bool searchDefault = true; // Initially show search options
  bool timeTableVisible = false; // Initially hide time table

  String? selectedStation; // Currently selected station
  String? selectedTime;
  List<Buses> buses = []; // List to hold buses for the selected station

  @override
  void initState() {
    super.initState();
    // Fetch the initial data when the widget is initialized
    BlocProvider.of<GetDataCubit>(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<GetDataCubit, GetDataState>(
      listener: (context, state) {
        if (state is SuccessGet) {
        } else if (state is SuccessGetBuses) {
          searchDefault = false;
          setState(() {
            buses = state.buses; // Get the list of buses from the state
            timeTableVisible =
                buses.isNotEmpty; // Show timetable if there are buses
          });
        } else if (state is FailedGet) {
          // Show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        // Access the station names from the cubit
        final stations = context
            .read<GetDataCubit>()
            .stationDetails
            .map((station) => station.stationName)
            .toList();

        return ModalProgressHUD(
          inAsyncCall: state is GetDataInitial,
          color: Colors.white,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xffFF6E6AFF),
              leading: IconButton(
                icon: SvgPicture.asset(
                  "assets/barrowsvg.svg",
                  height: 12,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                AppLocalizations.of(context)!.bus_time_line,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Jost',
                  fontSize: 15,
                ),
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Header Container
                      Container(
                        color: const Color(0xffFF6E6AFF),
                        height: height * 0.2,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.welcome_abrod,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Jost',
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!.here_is,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Search State UI
                      Visibility(
                        visible: searchDefault,
                        child: Column(
                          children: [
                            SizedBox(height: height * 0.25),
                            SvgPicture.asset(
                              "assets/search.svg",
                              height: height * 0.05,
                              color: Color(0xff6D6D6D),
                            ),
                            SizedBox(height: height * 0.03),
                            Text(
                              AppLocalizations.of(context)!.choose,
                              style: TextStyle(
                                  color: Color(0xff6D6D6D), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.06),
                      // Time Table UI
                      Visibility(
                        visible: timeTableVisible,
                        child: SizedBox(
                          height: height * 0.55,
                          child: ListView.builder(
                            itemCount: buses.length,
                            // Use the actual number of buses
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 10),
                                child: TimeTable(
                                  busNumber: buses[index].busNumber ?? "N/A",
                                  time: buses[index].departialTime ?? "N/A",
                                  busLine: buses[index].line?.lineName ?? "N/A",
                                ), // Pass the bus details here
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // White Container (overlapping)
                Positioned(
                  top: 80,
                  left: 15,
                  right: 15,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Station Dropdown
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/statt.svg",
                                height: height * 0.06,
                              ),
                              SizedBox(width: width * 0.02),
SizedBox(
  width: width * 0.7,
  child: DropdownMenu<String>(
    width: 400,
    menuHeight: 300,
    initialSelection: selectedStation,
    dropdownMenuEntries: stations
        .map((station) => DropdownMenuEntry<String>(
              value: station!,
              label: station.trim(),
            ))
        .toList(),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(),
      hintStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jost',
      ),
    ),
    hintText: AppLocalizations.of(context)!.select_station,
    onSelected: (String? value) {
      setState(() {
        selectedStation = value;

        // Fetch buses for the selected station
        if (selectedStation != null) {
          context.read<GetDataCubit>().getBusesForStation(selectedStation!);
        }
      });
    },
  ),
),




                            ],
                          ),

                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/statt.svg",
                                height: height * 0.06,
                              ),
                              SizedBox(width: width * 0.02),
                            SizedBox(
  width: width * 0.7,
  child: DropdownMenu<String>(
    width: 400,
    menuHeight: 300,
    initialSelection: selectedTime, // Set initial selection
    dropdownMenuEntries: buses
        .map((bus) => DropdownMenuEntry<String>(
              value: bus.departialTime!, // Set the value to the departure time
              label: 
                bus.departialTime?.substring(0, 5) ?? "N/A", // Display time (trimmed) or N/A
              
            ))
        .toList(),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(),
      hintStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jost',
      ),
    ),
    hintText: "Select time", // Placeholder text
    onSelected: (String? newValue) {
      setState(() {
        selectedTime = newValue; // Update the selected time
      });
    },
  ),
),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ////////////////////////////////////////////////////////////////////////
            bottomNavigationBar: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
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
          ),
        );
      },
    );
  }
}

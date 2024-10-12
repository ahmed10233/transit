import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:task_one/models/BusModel.dart';

part 'get_data_state.dart';
class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  final String baseUrl =
      "http://10.4.30.8:259/api/Tracking/get-station-details";

  List<Welcome> stationDetails = []; // Store the full station details
  List<Buses> buses = []; // List to hold the buses for the selected station

  // Fetch all station data
  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) ;
        stationDetails = data.map((station) => Welcome.fromJson(station)).toList();

        emit(SuccessGet(stationDetails));
      } else {
        emit(FailedGet(errorMessage: "There is an error, please try again"));
      }
    } catch (e) {
      emit(FailedGet(errorMessage: "There is an error, please try again"));
    }
  }

  // Fetch buses for a specific station
  Future<void> getBusesForStation(String stationName) async {
    try {
      // Find the station matching the stationName
      final station = stationDetails.firstWhere(
        (station) => station.stationName == stationName,
       
      );

      if (station.buses != null) {
        buses = station.buses!; // Get the list of buses for the selected station
        emit(SuccessGetBuses(buses)); // Emit the buses state
      } else {
        emit(FailedGet(errorMessage: 'No buses available for the selected station.'));
      }
    } catch (e) {
      emit(FailedGet(errorMessage: 'Error fetching data'));
    }
  }
}

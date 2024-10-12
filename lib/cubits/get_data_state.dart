part of 'get_data_cubit.dart';

@immutable
abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class SuccessGet extends GetDataState {
  final List<Welcome> stationDetails;

  SuccessGet(this.stationDetails);
}

class SuccessGetBuses extends GetDataState {
  final List<Buses> buses;

  SuccessGetBuses(this.buses);
}

class FailedGet extends GetDataState {
  final String errorMessage;

  FailedGet({required this.errorMessage});
}

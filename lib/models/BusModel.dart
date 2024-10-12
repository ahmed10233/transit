class Welcome {
  int? stationId;
  String? stationName;
  List<Buses>? buses;

  Welcome({this.stationId, this.stationName, this.buses});

  Welcome.fromJson(Map<String, dynamic> json) {
    stationId = json['stationId'];
    stationName = json['stationName'];
    if (json['buses'] != null) {
      buses = <Buses>[];
      json['buses'].forEach((v) {
        buses!.add(Buses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stationId'] = stationId;
    data['stationName'] = stationName;
    if (buses != null) {
      data['buses'] = buses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Buses {
  int? busId;
  String? busNumber;
  String? departialTime;
  Line? line;

  Buses({this.busId, this.busNumber, this.departialTime, this.line});

  Buses.fromJson(Map<String, dynamic> json) {
    busId = json['busId'];
    busNumber = json['busNumber'];
    departialTime = json['departialTime'];
    line = json['line'] != null ? Line.fromJson(json['line']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['busId'] = busId;
    data['busNumber'] = busNumber;
    data['departialTime'] = departialTime;
    if (line != null) {
      data['line'] = line!.toJson();
    }
    return data;
  }
}

class Line {
  int? lineId;
  String? lineName;

  Line({this.lineId, this.lineName});

  Line.fromJson(Map<String, dynamic> json) {
    lineId = json['lineId'];
    lineName = json['lineName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lineId'] = lineId;
    data['lineName'] = lineName;
    return data;
  }
}
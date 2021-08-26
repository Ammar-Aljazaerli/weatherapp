import 'package:intl/intl.dart';

String kToC(temp) {
  var c = temp - 273.15;
  var s = c.round();
  return s.toString();
}

String isoToDayName(date) {
  String addTZ = date.toString() + '000'.toString();
  print(addTZ);
  var t = DateTime.fromMillisecondsSinceEpoch(int.parse(addTZ), isUtc: false);
  var g = DateFormat('EE').format(t);
  print(g);
  return g;
}

String isoToDateFormat(int? date) {
  int addTZ = date! * 1000;
  print(addTZ);
  var t = DateTime.fromMillisecondsSinceEpoch(addTZ, isUtc: true);
  var g = DateFormat('EE dd/MM/yyyy').format(t);
  print(g);
  return g.toString();
}

String isoToDayMonNum(date) {
  String addTZ = date.toString() + '000'.toString();
  print(addTZ);
  var t = DateTime.fromMillisecondsSinceEpoch(int.parse(addTZ), isUtc: true);
  var g = DateFormat('dd/MM').format(t);
  print(g);
  return g;
}

String isoToHour(date) {
  String addTZ = date.toString() + '000'.toString();
  print(addTZ);
  var t = DateTime.fromMillisecondsSinceEpoch(int.parse(addTZ), isUtc: true);
  var g = DateFormat('hh:mm:aa').format(t);
  print(g);
  return g;
}

String isoToDayNum(date) {
  String addTZ = date.toString() + '000'.toString();
  print(addTZ);
  var t = DateTime.fromMillisecondsSinceEpoch(int.parse(addTZ), isUtc: true);
  var g = DateFormat('dd').format(t);
  print(g);
  return g;
}

String findIcon(String name) {
  switch (name) {
    case "clear sky":
      return "assets/icons/Mostly Sunny.svg";
      break;
    case "few clouds":
      return "assets/icons/Party Cloudy.svg";
      break;
    case "Clouds":
      return "assets/icons/Mostly Cloudy.svg";
      break;
    case "Rain":
      return "assets/icons/Rain.svg";
      break;
    case "Drizzle":
      return "assets/icons/Drizzle.svg";
      break;
    case "Thunderstorm":
      return "assets/icons/Severe Thunderstorm.svg";
      break;
    case "Snow":
      return "assets/icons/Snow.svg";
      break;
    case "mist":
      return "assets/icons/Smoke.svg";
      break;
    default:
      return "assets/icons/Fog.svg";
  }
}

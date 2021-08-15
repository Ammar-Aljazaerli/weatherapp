var url = Uri.parse(
    'https://api.openweathermap.org/data/2.5/forecast?id=292223&appid=7956ac64be1e40e0f8bbb3aebfd4d201');

    String kToC(temp) {
    var c = temp - 273.15;
    var s = c.round();
    return s.toString();
  }
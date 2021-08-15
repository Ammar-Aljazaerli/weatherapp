import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/Screens/second/second_screen.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/utilities/constants.dart';

class WeatherItemCard extends StatelessWidget {
  const WeatherItemCard({
    Key? key,
    required this.index,
    required this.dateDays,
    required this.model,
  }) : super(key: key);
  final int index;

  final DateTime dateDays;
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WeatherDeteilsScreen(
                      index: index,
                    )));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Color(0xFFF6F6F6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(DateFormat('EE').format(dateDays)),
              Text('${DateFormat(" dd/MM ").format(dateDays)}'),
              Container(
                padding: EdgeInsets.all(5.0),
                height: 50.0,
                width: 50.0,
                child: SvgPicture.asset(
                  'assets/icons/Clear Night.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                '${model.list![index].weather![0].description}',
                overflow: TextOverflow.ellipsis,
                
              ),
              Text(
                  '${kToC(model.list![index].main!.tempMax)}/${kToC(model.list![index].main!.tempMin)}°C'),
            ],
          ),
        ),
      ),
    );
  }
}

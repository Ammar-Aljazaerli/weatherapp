import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp/utilities/constants.dart';

class WeatherItemCard extends StatelessWidget {
  const WeatherItemCard({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);
  final int index;
  final model;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 30 / 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        color: const Color.fromRGBO(246, 246, 246, 0.8),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(isoToDayName(model[index].dt)),
                Text('${isoToDayMonNum(model[index].dt)}'),
                SizedBox(height: height * 1 / 100),
                Container(
                  padding: const EdgeInsets.all(1),
                  height: height * 10 / 100,
                  width: width * 10 / 100,
                  child: SvgPicture.asset(
                    findIcon(model[index].weather![0].description),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: height * 1 / 100),
                Expanded(
                  child: Text(
                    '${model[index].weather![0].description}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                    '${model[index].temp!.max.toString()}/${model[index].temp!.min.toString()}°C'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

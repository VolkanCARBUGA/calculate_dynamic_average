import 'package:calculate_dynamic_average/constants/constants.dart';
import 'package:flutter/material.dart';

class AverageView extends StatelessWidget {
  const AverageView({super.key, required this.average, required this.lessonNumber});

  final double average;

  final int lessonNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lessonNumber>0?"$lessonNumber Ders girildi":"Ders seçiniz",style: Constants.lessonNumberStyle,
          ),
          Text(
            average>0?"$average":"0.0",style: Constants.averageStyle,
          ),
          Text("Ortalama",style: Constants.averageStyle,),
        ],
      ),
    );
  }
}

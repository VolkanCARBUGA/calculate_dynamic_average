import 'package:calculate_dynamic_average/average_calculate.dart';
import 'package:calculate_dynamic_average/constants/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primaryColor: Constants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity
        ),
      home: const AverageCalculate(),
    );
  }
}
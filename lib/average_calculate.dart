import 'package:calculate_dynamic_average/average_view.dart';
import 'package:calculate_dynamic_average/constants/constants.dart';
import 'package:flutter/material.dart';

class AverageCalculate extends StatefulWidget {
  const AverageCalculate({super.key});

  @override
  State<AverageCalculate> createState() => _AverageCalculateState();
}

class _AverageCalculateState extends State<AverageCalculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Ortalama Hesapla", style: Constants.tittleStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.purple,
                  child: buildForm(),
                ),
              ),
              Expanded(
                flex: 1,
                child: AverageView(average: 2.50, lessonNumber: 4),
              )
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Text(
                "form",
                style: Constants.tittleStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

var key = GlobalKey<FormState>();
Widget buildForm() {
  return Form(
      key: key,
      child: Column(
        children: [
          buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          )
        ],
      ));
}

Widget buildTextFormField() {
  return TextFormField(
    decoration: InputDecoration(
        hintText: "Matematik",
        filled: true,
        fillColor: Constants.mainColor,
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
        )),
  );
}

import 'package:calculate_dynamic_average/DbHelper/db_helper.dart';
import 'package:calculate_dynamic_average/average_view.dart';
import 'package:calculate_dynamic_average/constants/constants.dart';
import 'package:calculate_dynamic_average/lesson.dart';
import 'package:flutter/material.dart';

class AverageCalculate extends StatefulWidget {
  const AverageCalculate({super.key});

  @override
  State<AverageCalculate> createState() => _AverageCalculateState();
}

class _AverageCalculateState extends State<AverageCalculate> {
  List<Lesson> allLesson = [];

  double secilen = 1;
  double secilenKredi = 1;
  String girilenDersAdi = 'Ders Adı Girilmemiş';
  double krediDegeri = 1;
  double notDegeri = 4;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text("Ortalama Hesapla", style: Constants.tittleStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               myForm(),
              AverageView(
                lessonNumber: allLesson.length,
                average: ortalamaHesapla(),

              )
            ],
          ),
          allLesson.length > 0
              ? ListView.builder(
                shrinkWrap: true,
                  itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (a) {
                      setState(() {
                        allLesson.removeAt(index);
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Card(
                        child: ListTile(
                          title: Text(allLesson[index].name),
                          leading: CircleAvatar(
                            backgroundColor: Constants.mainColor,
                            child: Text('' +
                                (allLesson[index].creditValue *
                                        allLesson[index].letterValue)
                                    .toStringAsFixed(0)),
                          ),
                          subtitle: Text(
                              '${allLesson[index].creditValue} Kredi, Not Değeri ${allLesson[index].letterValue}'),
                        ),
                      ),
                    ),
                  ),
                  itemCount: allLesson.length,
                )
              : Container(
                  margin: EdgeInsets.all(24),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('Lütfen ders ekleyiniz',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Constants.mainColor)),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
  Form myForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: _buildHarfler(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: _buildKrediler(),
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var eklenecekDers =
                        Lesson(girilenDersAdi, secilen, secilenKredi);
                    allLesson.insert(0, eklenecekDers);
                    ortalamaHesapla();
                    setState(() {});
                  }
                },
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Constants.mainColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        girilenDersAdi = deger!;
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Boş bırakma ders adını';
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: 'Matematik',
          border: OutlineInputBorder(
            borderRadius: Constants.borderRadius,
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(0.3)),
    );
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
  Widget _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButton<double>(
        iconEnabledColor: Constants.mainColor.shade200,
        elevation: 16,
        items: DbHelper.tumDersHarfleri(),
        underline: Container(),
        onChanged: (dd) {
          setState(() {
            secilen = dd!;
            
          });
        },
        value: secilen,
      ),
    );
  }
   Widget _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButton<double>(
        iconEnabledColor: Constants.mainColor.shade200,
        elevation: 16,
        items: DbHelper.tumKrediler(),
        underline: Container(),
        onChanged: (dd) {
          setState(() {
            secilenKredi = dd!;
            print(dd);
          });
        },
        value: secilenKredi,
      ),
    );
  }
   double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    allLesson.forEach((element) {
      toplamNot = toplamNot + (element.creditValue * element.letterValue);
      toplamKredi = toplamKredi + element.creditValue;
    });
    return toplamNot / toplamKredi;
  }
}







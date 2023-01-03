import 'dart:ffi';
import './soru.dart';
import 'package:flutter/material.dart';
import 'package:hesap/soru.dart';
import 'package:hesap/test_veri.dart';

import 'constans.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.purple[900],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget>secimler=[];

TestVeri test_1=TestVeri();

  Soru soru_1 = Soru(soruMetni: 'Erkekler "Men" diye yazılır.', soruYaniti: true );
  Soru soru_2 = Soru(soruMetni: 'Kadın kelimesi "Women" diye yazılır.', soruYaniti: false);
  Soru soru_3 = Soru(soruMetni: '"Snake" yılan demektir.', soruYaniti: true );
  Soru soru_4 = Soru(soruMetni: 'Karşıdaki insana "He/She" diye hitap edilir.', soruYaniti: false);

void butonFonksiyonu (bool secilenButon) {
  if (test_1.testBittiMi() == true) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Test Bitti."),
          content: new Text("Umarım Bir Şeyler Öğrenmişsindir :)"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Başa Dön"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  test_1.testiSifirla();
                  secimler=[];
                });
              },
            ),
          ],
        );
      },
    );
  } else {
    setState(() {
      test_1.getSoruYaniti() == secilenButon
          ? secimler.add(dogruIconu)
          : secimler.add(yanlisIconu);

      test_1.sonrakiSoru();
    });
  }
}



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 3,
          children: secimler,),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                              color: Colors.red,
                          ),
                          onPressed: () {

                            butonFonksiyonu(false);
                           // test_1.soruBankasi[soruIndex].soruYaniti=false;


                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          child: Icon(Icons.thumb_up, size: 30.0, color: Colors.green,),
                          onPressed: () {
                           // test_1.soruBankasi[soruIndex].soruYaniti=true
                            butonFonksiyonu(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}




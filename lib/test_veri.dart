import 'soru.dart';
import 'package:flutter/material.dart';

class TestVeri{
  int _soruIndex=0;

  List <Soru> _soruBankasi =[Soru(soruMetni: 'Erkekler "Men" diye yazılır.', soruYaniti: true ),

    Soru(soruMetni: 'Kadın kelimesi "Women" diye yazılır.', soruYaniti: false),

    Soru(soruMetni: '"Snake" yılan demektir.', soruYaniti: true ),

    Soru(soruMetni: 'Karşıdaki insana "He/She" diye hitap edilir.', soruYaniti: false)
  ];

  String getSoruMetni(){
   return _soruBankasi[_soruIndex].soruMetni;

  }

  bool getSoruYaniti(){
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru(){
    if(_soruIndex+1<_soruBankasi.length)
    {_soruIndex++;}
  }

bool testBittiMi (){
    if(_soruIndex+1 >= _soruBankasi.length){
      return true;
    }
    else
    {return false;}
}

void testiSifirla(){
    _soruIndex=0;
}
}
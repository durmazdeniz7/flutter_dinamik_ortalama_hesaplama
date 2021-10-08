import 'package:dinamik_ortalama_hesaplama/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _tumDerslerinHarfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri().map((e) {
      return DropdownMenuItem<double>(child: Text(e), value: _harfiNotaCevir(e));
    }).toList();
  }

  static List<int> _tumKrediler(){
  return List.generate(10, (index) => index+1).toList();
}
static List<DropdownMenuItem<double>> tumDerslerinKredileri(){
  return _tumKrediler().map((e){
    return DropdownMenuItem<double>(
      child: Text(e.toString()),
      value: e.toDouble(),
    );
  }).toList();
} 


static List<Ders> tumeklenenDersler=  [];

static dersEkle(Ders ders){
  tumeklenenDersler.add(ders);
}

static double ortalamBul(){
    double toplamNot=0;
     double toplamKredi=0;
     tumeklenenDersler.forEach((element) {
       toplamNot+=element.krediDeger*element.harfDegeri;
       toplamKredi+=element.krediDeger;

     });

     return toplamNot/toplamKredi;
}

}

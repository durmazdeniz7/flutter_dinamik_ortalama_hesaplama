import 'package:dinamik_ortalama_hesaplama/constants/sabitler.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
   OrtalamaGoster({required this.ortalama,required this.dersSayisi, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi>0?"$dersSayisi Ders Girildi":"Ders Seçiniz",style: Sabitler.ortalamaGosterBodtStyle,
        ),
        Text(ortalama>=0?"${ortalama.toStringAsFixed(2)}":"0.0",style: Sabitler.ortalamaStyle,),
        Text("Ortalama",style: Sabitler.ortalamaGosterBodtStyle,),



      ],
    );
  }
}
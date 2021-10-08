import 'package:dinamik_ortalama_hesaplama/constants/sabitler.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';


void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dinamik Ortalama Hesapla",
      theme: ThemeData(primarySwatch:Sabitler.anaRenk
      ,visualDensity: VisualDensity.adaptivePlatformDensity
      
      ),
      debugShowCheckedModeBanner: false,
      home: OrtalamaHesaplaPage()
    );
  }
}
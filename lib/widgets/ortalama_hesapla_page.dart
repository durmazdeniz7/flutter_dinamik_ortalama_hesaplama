import 'package:dinamik_ortalama_hesaplama/constants/sabitler.dart';
import 'package:dinamik_ortalama_hesaplama/data/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/ders.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  double _krediValue = 1;
  double _value = 4;

  String girilenDersAdi = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(girilenDersAdi);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.myTitleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildForm(),
                flex: 2,
              ),
              Expanded(
                child: OrtalamaGoster(
                    ortalama: DataHelper.ortalamBul(),
                    dersSayisi: DataHelper.tumeklenenDersler.length),
                flex: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: Container(
            child: DersListesi(
              onDismis: (index) {
                setState(() {
                  DataHelper.tumeklenenDersler.removeAt(index);
                });
              },
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropDown(
                    onHarfSecildi: (value) {
                      _value = value;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropDownWidget(onKrediSecildi: (krediValue){
_krediValue=krediValue;
                  },),
                ),
              ),
              IconButton(
                  onPressed: _dersEkle,
                  icon: const Icon(Icons.arrow_forward_ios_sharp)),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (degeer) {
        setState(() {
          girilenDersAdi = degeer!;
        });
      },
      validator: (String? deger) {
        if (deger!.length <= 0) {
          return "Ders Adınız Giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2)),
    );
  }

 
  void _dersEkle() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers =
          Ders(ad: girilenDersAdi, harfDegeri: _value, krediDeger: _krediValue);
      setState(() {
        DataHelper.dersEkle(eklenecekDers);
      });
  
    }
  }
}

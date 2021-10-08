import 'package:dinamik_ortalama_hesaplama/constants/sabitler.dart';
import 'package:dinamik_ortalama_hesaplama/data/data_helper.dart';
import 'package:flutter/material.dart';


class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
    double _krediValue=1;

   KrediDropDownWidget({required this.onKrediSecildi,Key? key }) : super(key: key);

  @override
  _KrediDropDownWidgetState createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  @override
  Widget build(BuildContext context) {
   return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: widget._krediValue,
        onChanged: (newValue) {
          setState(() {
           widget._krediValue = newValue!;
           widget.onKrediSecildi(newValue);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
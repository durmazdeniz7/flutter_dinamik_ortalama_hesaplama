import 'package:dinamik_ortalama_hesaplama/constants/sabitler.dart';
import 'package:dinamik_ortalama_hesaplama/data/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropDown extends StatefulWidget {
  final Function onHarfSecildi;

  const HarfDropDown({ required this.onHarfSecildi,Key? key }) : super(key: key);

  @override
  _HarfDropDownState createState() => _HarfDropDownState();
}

class _HarfDropDownState extends State<HarfDropDown> {
    double _value = 4;

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
          onChanged: (newValue) {
            setState(() {
              _value = newValue!;
              widget.onHarfSecildi(newValue);
            });
          },
          value: _value,
          underline: Container(),
          items: DataHelper.tumDerslerinHarfleri()),
    );
  }
}
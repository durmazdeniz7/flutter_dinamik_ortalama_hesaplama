
import 'package:dinamik_ortalama_hesaplama/constants/sabitler.dart';
import 'package:dinamik_ortalama_hesaplama/data/data_helper.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismis; 
  const DersListesi({required this.onDismis,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataHelper.tumeklenenDersler.isEmpty
        ? Center(
            child: Text(
            "Ders Ekleyin",
            style: Sabitler.myTitleStyle,
          ))
        : ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                onDismis(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                    child: ListTile(
                      title: Text(DataHelper.tumeklenenDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk.shade800,
                        child: Text((DataHelper
                                    .tumeklenenDersler[index].harfDegeri *
                                DataHelper.tumeklenenDersler[index].krediDeger)
                            .toString()),
                      ),
                      subtitle: Text(
                          "${DataHelper.tumeklenenDersler[index].krediDeger} Kredi, Not Değeri ${DataHelper.tumeklenenDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            },
            itemCount: DataHelper.tumeklenenDersler.length,
          );
  }
}

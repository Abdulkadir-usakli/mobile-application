import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/datas/data.dart';
import 'package:ortalama_hesaplama/model/ders.dart';
import 'package:ortalama_hesaplama/sabitler/sabitler.dart';

class Derslistesi extends StatelessWidget {
  final Function onDismiss;
  const Derslistesi({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = Veriler.tumEklenenDers;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toString()),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} kredi ,Not Değeri ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                'LÜTFEN DERS EKLEYİNİZ',
                style: Sabitler.baslikStyle,
              ),
            ),
          );
  }
}

import 'package:burclar/burcitem.dart';
import 'package:burclar/data/string.dart';
import 'package:burclar/model/burc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class burcListesi extends StatelessWidget {
  late List<Burc> tumburclar;
  burcListesi() {
    tumburclar = veriKaynagi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BURÇLAR LİSTESİ',style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return burcItem(listelenen: tumburclar[index]);
        },
        itemCount: tumburclar.length,
      )),
    );
  }

  List<Burc> veriKaynagi() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';
      Burc eklenenBurc = Burc(
          burcAdi, burcTarihi, burcDetay, burcKucukResim, burcBuyukResim,
          adi: burcAdi,
          tarihi: burcTarihi,
          detay: burcDetay,
          kucukresim: burcKucukResim,
          buyukresim: burcBuyukResim);
      gecici.add(eklenenBurc);
    }
    return gecici;
  }
}

import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/model/ders.dart';

class Veriler {
  static List<Ders> tumEklenenDers = [];
  static dersEkle(Ders ders) {
    tumEklenenDers.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamKredi = 0;
    double toplamNot = 0;
    tumEklenenDers.forEach((element) {
      toplamNot +=(element.harfDegeri * element.krediDegeri);
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }

  static List<String> _dersharleri() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FF'];
  }

  static double _dersNotlari(String harf) {
    switch (harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FF':
        return 0.0;
      default:
        return 1.0;
    }
  }

  static List<DropdownMenuItem<double>> tumDersler() {
    return _dersharleri()
        .map(
          (e) => DropdownMenuItem(
             value: _dersNotlari(e),
            child: Text(e),
          ),
        )
        .toList();
  }

  static List<int> _dersKredileri() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumKrediler() {
    return _dersKredileri()
        .map((e) => DropdownMenuItem(
           value: e.toDouble(),
              child: Text(e.toString()),
            ))
        .toList();
  }
}

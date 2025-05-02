import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/sabitler/sabitler.dart';
import 'package:ortalama_hesaplama/widget/ortalamahesapla.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'DİNAMİK ORTALAMA HESAPLAMA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ortalamaHesapla(),
    );
  }
}

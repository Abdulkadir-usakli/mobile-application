import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/datas/data.dart';
import 'package:ortalama_hesaplama/model/ders.dart';
import 'package:ortalama_hesaplama/sabitler/sabitler.dart';
import 'package:ortalama_hesaplama/widget/derslistesi.dart';
import 'package:ortalama_hesaplama/widget/ortalamagoster.dart';

class ortalamaHesapla extends StatefulWidget {
  const ortalamaHesapla({super.key});

  @override
  State<ortalamaHesapla> createState() => _ortalamaHesaplaState();
}

class _ortalamaHesaplaState extends State<ortalamaHesapla> {
  var formkey = GlobalKey<FormState>();
  double secilenHarf = 4;
  double secilenKredi = 1;
  String girilenDers = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(Sabitler.baslikText, style: Sabitler.baslikStyle),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: _buildForm(),
                  )),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    dersSayisi: Veriler.tumEklenenDers.length,
                    ortalama: Veriler.ortalamaHesapla()),
              ),
            ],
          ),
          Expanded(
            child: Derslistesi(
              onDismiss: (index) {
                Veriler.tumEklenenDers.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          _buildTextFormField(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildHarf(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildkredi(),
                ),
              ),
              IconButton(
                  onPressed: _dersEkleveCikar,
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  iconSize: 30),
            ],
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDers = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders Adını Giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'DERS YAZINIZ',
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100,
      ),
    );
  }

  _buildHarf() {
    return Container(
      alignment: Alignment.center,
      padding:const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
          value: secilenHarf,
          iconEnabledColor: Sabitler.anaRenk,
          items: Veriler.tumDersler(),
          onChanged: (deger) {
            setState(() {
              secilenHarf = deger!;
            });
          }),
    );
  }

  _buildkredi() {
    return Container(
      alignment: Alignment.center,
      padding:const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
          value: secilenKredi,
          iconEnabledColor: Sabitler.anaRenk,
          items: Veriler.tumKrediler(),
          onChanged: (deger) {
            setState(() {
              secilenKredi = deger!;
            });
          }),
    );
  }

  void _dersEkleveCikar() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDers, harfDegeri: secilenHarf, krediDegeri: secilenKredi);
      Veriler.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}

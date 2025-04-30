import 'package:burclar/burcdetay.dart';
import 'package:burclar/model/burc.dart';
import 'package:flutter/material.dart';

class burcItem extends StatelessWidget {
  final Burc listelenen;
  const burcItem({required this.listelenen, super.key});

  @override
  Widget build(BuildContext context) {
    var myStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => burcdetay(secilenBurc: listelenen),
                ),
              );
            },
            leading: Image.asset("images/" + listelenen.kucukresim),
            title: Text(
              listelenen.adi,
              style: myStyle.headlineMedium,
            ),
            subtitle: Text(
              listelenen.tarihi,
              style: myStyle.labelMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
          ),
        ),
      ),
    );
  }
}

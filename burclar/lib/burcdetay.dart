import 'package:burclar/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class burcdetay extends StatefulWidget {
  final Burc secilenBurc;
  const burcdetay({required this.secilenBurc, super.key});

  @override
  State<burcdetay> createState() => _burcdetayState();
}

class _burcdetayState extends State<burcdetay> {
  Color rengi = Colors.transparent;
  late PaletteGenerator generator;

  @override
  void initState() {
    super.initState();
    rengiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: rengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.adi + " Burcu Ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                'images/' + widget.secilenBurc.buyukresim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.detay,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void rengiBul() async {
    generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/' + widget.secilenBurc.buyukresim));
    rengi = generator.darkMutedColor!.color;
    setState(() {
      
    });
  }
}

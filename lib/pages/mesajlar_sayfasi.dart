import 'package:flutter/material.dart';

class MesajlarSayfasi extends StatefulWidget {
  const MesajlarSayfasi({Key? key}) : super(key: key);

  @override
  _MesajlarSayfasiState createState() => _MesajlarSayfasiState();
}

class _MesajlarSayfasiState extends State<MesajlarSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mesajlar')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          bool benMiyim = true;
          return Align(
            alignment: Alignment.centerRight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2)
              ),
              child: Text("mesaj"),
            ),
          );
        },
      ),
    );
  }
}

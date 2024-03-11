import 'package:flutter/material.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  const OgretmenlerSayfasi({Key? key}) : super(key: key);

  @override
  _OgretmenlerSayfasiState createState() => _OgretmenlerSayfasiState();
}

class _OgretmenlerSayfasiState extends State<OgretmenlerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Öğretmenler')),
      body: Column(
        children: [
          const PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Text("10 Oğretmen"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => const ListTile(
                title: Text("Ali"),
                leading: Text("👨"),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: 25,
            ),
          ),
        ],
      ),
    );
  }
}

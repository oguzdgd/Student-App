import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OgrencilerSayfasi extends StatefulWidget {
  const OgrencilerSayfasi({Key? key}) : super(key: key);

  @override
  _OgrencilerSayfasiState createState() => _OgrencilerSayfasiState();
}

class _OgrencilerSayfasiState extends State<OgrencilerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenciler'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Text("10 Oğrenci"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: const Text("Ali"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
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

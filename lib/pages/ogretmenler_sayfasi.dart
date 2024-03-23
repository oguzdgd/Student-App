import 'package:flutter/material.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  final OgretmenlerRepository ogretmenlerRepository;
  const OgretmenlerSayfasi(this.ogretmenlerRepository, {Key? key}) : super(key: key);

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
           PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Text("${widget.ogretmenlerRepository.ogretmenler.length} öğrenci"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => OgretmenSatiri(
                  widget.ogretmenlerRepository.ogretmenler[index],
                  widget.ogretmenlerRepository
              ),
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
              itemCount: widget.ogretmenlerRepository.ogretmenler.length,
            ),
          ),
        ],
      ),
    );
  }
}

class OgretmenSatiri extends StatelessWidget {
  final Ogretmen ogretmen;
  final OgretmenlerRepository ogretmenlerRepository;
  const OgretmenSatiri( this.ogretmen,  this.ogretmenlerRepository, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(ogretmen.ad + " " +ogretmen.soyad),
      leading: Text(ogretmen.cinsiyet =="Kadın" ?"👩" :"👨"),


    );
  }
}

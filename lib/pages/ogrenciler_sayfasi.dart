import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';

class OgrencilerSayfasi extends StatefulWidget {
  final OgrencilerRepository ogrencilerRepository;
  const OgrencilerSayfasi(this.ogrencilerRepository, {Key? key}) : super(key: key);

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
           PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Text("${widget.ogrencilerRepository.ogrenciler.length} öğrenci"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => OgrenciSatiri(
                widget.ogrencilerRepository.ogrenciler[index],
                  widget.ogrencilerRepository
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: widget.ogrencilerRepository.ogrenciler.length,
            ),
          ),
        ],
      ),
    );
  }
}

class OgrenciSatiri extends StatefulWidget {
  final Ogrenci ogrenci;
  final OgrencilerRepository ogrencilerRepository;
  const OgrenciSatiri( this.ogrenci, OgrencilerRepository this.ogrencilerRepository, {
    super.key,
  });

  @override
  State<OgrenciSatiri> createState() => _OgrenciSatiriState();
}

class _OgrenciSatiriState extends State<OgrenciSatiri> {
  @override
  Widget build(BuildContext context) {
    bool seviyorMuyum = widget.ogrencilerRepository.seviyorMuyum(widget.ogrenci);
    return ListTile(
      title:  Text(widget.ogrenci.ad + " " +widget.ogrenci.soyad),
      leading: Text(widget.ogrenci.cinsiyet =="Kadın" ?"👩" :"👨"),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            widget.ogrencilerRepository.sev(widget.ogrenci, !seviyorMuyum );
          });
        },
        icon: Icon(seviyorMuyum? Icons.favorite : Icons.favorite_border),
      ),

    );
  }
}

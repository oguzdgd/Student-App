import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_app/repository/mesajlar_repository.dart';


class MesajlarSayfasi extends StatefulWidget {
  final MesajlarRepository mesajlarRepository;
  const MesajlarSayfasi(this.mesajlarRepository, {Key? key}) : super(key: key);

  @override
  _MesajlarSayfasiState createState() => _MesajlarSayfasiState();
}

class _MesajlarSayfasiState extends State<MesajlarSayfasi> {
  @override
  void initState() {
    widget.mesajlarRepository.yeniMesajSayisi=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mesajlar')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: widget.mesajlarRepository.mesajlar.length,
              itemBuilder: (BuildContext context, int index) {
                return MesajGorunumu( widget.mesajlarRepository.mesajlar[widget.mesajlarRepository.mesajlar.length - index -1]);
              },
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: Colors.blue[700],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MesajGorunumu extends StatelessWidget {
  final Mesaj mesaj;
  const MesajGorunumu( this.mesaj, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          mesaj.gonderen != "Ali" ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            color: Colors.lightBlue[100],
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child:  Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              mesaj.yazi,
            ),
          ),
        ),
      ),
    );
  }
}

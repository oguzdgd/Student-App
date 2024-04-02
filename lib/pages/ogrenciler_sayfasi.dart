import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';

import '../models/ogrenci.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi( {super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
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
                padding: const EdgeInsets.symmetric( vertical: 20),
                child: Text("${ogrencilerRepository.ogrenciler.length} öğrenci"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => OgrenciSatiri(
                ogrencilerRepository.ogrenciler[index],

              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: ogrencilerRepository.ogrenciler.length,
            ),
          ),
        ],
      ),
    );
  }
}

class OgrenciSatiri extends ConsumerWidget {
  final Ogrenci ogrenci;

  const OgrenciSatiri( this.ogrenci, {
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool seviyorMuyum = ref.watch(ogrencilerProvider).seviyorMuyum(ogrenci);
    return ListTile(
      //implicit Animasyon örneği
      title:  AnimatedPadding(
          padding: seviyorMuyum ? const EdgeInsets.only(left: 60) : const EdgeInsets.only() ,
          duration: const Duration(seconds: 1),
        curve: Curves.bounceOut,
          child: Text("${ogrenci.ad} ${ogrenci.soyad}"),
      ),
      leading: Text(ogrenci.cinsiyet =="Kadın" ?"👩" :"👨"),
      trailing: IconButton(
        onPressed: () {
            ref.read(ogrencilerProvider).sev(ogrenci, !seviyorMuyum );
        },
        // integration  test için bu yorum satırını kullanın.
        // icon: seviyorMuyum ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
          //implicit Animasyon örneği
        icon:AnimatedCrossFade(
          firstChild: const Icon(Icons.favorite),
          secondChild: const Icon(Icons.favorite_border),
          crossFadeState: seviyorMuyum ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds:1),

        )
      ),

    );
  }
}

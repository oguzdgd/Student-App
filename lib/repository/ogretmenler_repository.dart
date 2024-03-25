import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/services/data_service.dart';

import '../models/ogretmen.dart';

class OgretmenlerRepository extends ChangeNotifier{
  List ogretmenler=[
    Ogretmen("Zeki", "Yetgin", 19, "Erkek"),
    Ogretmen("Jale", "Bektaş", 20, "Kadın")
  ];

  final DataService dataService;
  OgretmenlerRepository( this.dataService);



  Future<void> indir() async {
    Ogretmen ogretmen = await dataService.ogretmenIndir();

    ogretmenler.add(ogretmen);
    notifyListeners();
  }
}

final ogretmenlerProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository(ref.watch(dataServiceProvider));
},);


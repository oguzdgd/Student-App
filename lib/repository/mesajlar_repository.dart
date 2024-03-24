import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MesajlarRepository extends ChangeNotifier{

  final List<Mesaj> mesajlar = [
    Mesaj("Selam", "Ali", DateTime.now().subtract(Duration(minutes: 3))),
    Mesaj("Merhaba", "Ayşe", DateTime.now().subtract(Duration(minutes: 2))),
    Mesaj("Nasılsın?", "Ali", DateTime.now().subtract(Duration(minutes: 1))),
    Mesaj("İyiyim ders çalışıyorum sen?", "Ayşe", DateTime.now())
  ];

}

final mesajlarProvider= ChangeNotifierProvider((ref) {
  return MesajlarRepository();
},);


class YeniMesajSayisi extends StateNotifier<int>{
  YeniMesajSayisi(super.state);

  void sifirla(){
    state=0;
  }
}

final yeniMesajSayisiProvider = StateNotifierProvider<YeniMesajSayisi,int>((ref) {
  return YeniMesajSayisi(4);
},);

class Mesaj{
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}
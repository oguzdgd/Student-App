class MesajlarRepository{

  final List<Mesaj> mesajlar = [
    Mesaj("Selam", "Ali", DateTime.now().subtract(Duration(minutes: 3))),
    Mesaj("Merhaba", "Ayşe", DateTime.now().subtract(Duration(minutes: 2))),
    Mesaj("Nasılsın?", "Ali", DateTime.now().subtract(Duration(minutes: 1))),
    Mesaj("İyiyim ders çalışıyorum sen?", "Ayşe", DateTime.now())
  ];
  int yeniMesajSayisi=4;
}

class Mesaj{
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}
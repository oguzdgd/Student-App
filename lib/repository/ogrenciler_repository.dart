class OgrencilerRepository{
  final List<Ogrenci> ogrenciler=[
    Ogrenci("Ali", "Kılıç", 19, "Erkek"),
    Ogrenci("Ayşe", "Rüzgar", 20, "Kadın")
  ];

  final Set<Ogrenci> sevdiklerim = {};
  void sev(Ogrenci ogrenci, bool seviyorMuyum) {
    if(seviyorMuyum){
    sevdiklerim.add(ogrenci);
    }else{
      sevdiklerim.remove(ogrenci);
    }
  }

  bool seviyorMuyum(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }

}

class Ogrenci{
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogrenci(this.ad, this.soyad, this.yas, this.cinsiyet);
}
class OgretmenlerRepository{
  List ogretmenler=[
    Ogretmen("Zeki", "Yetgin", 19, "Erkek"),
    Ogretmen("Jale", "Bektaş", 20, "Kadın")
  ];
}

class Ogretmen{
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}
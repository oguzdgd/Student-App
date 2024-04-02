import 'package:flutter_test/flutter_test.dart';
import 'package:ogrenci_app/models/ogrenci.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';


void main() {
  group("Ogrenci Sevme", () {

    test('Sevdiğim öğrenci sevilmiş olarak görünüyor', () {
      final ogrencilerRepository = OgrencilerRepository();
      final yeniOgrenci = Ogrenci("Ali", "Veli", 22, "Erkek");
      ogrencilerRepository.ogrenciler.add(yeniOgrenci);
      expect( ogrencilerRepository.seviyorMuyum(yeniOgrenci),false);
      ogrencilerRepository.sev(yeniOgrenci,true);
      expect( ogrencilerRepository.seviyorMuyum(yeniOgrenci),true);
      ogrencilerRepository.sev(yeniOgrenci,false);
      expect( ogrencilerRepository.seviyorMuyum(yeniOgrenci),false);
      ogrencilerRepository.ogrenciler.remove(yeniOgrenci);
      expect( ogrencilerRepository.seviyorMuyum(yeniOgrenci),false);
    });

    test('Bilinmeyen ogrenci seviliyor', () {
      final ogrencilerRepository = OgrencilerRepository();
      final yeniOgrenci = Ogrenci("Ali", "Veli", 22, "Erkek");

      expect( ogrencilerRepository.seviyorMuyum(yeniOgrenci),false);
    });

  });
}
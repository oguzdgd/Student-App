import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/services/data_service.dart';

import '../../models/ogretmen.dart';


class OgretmenForm extends ConsumerStatefulWidget {
  const OgretmenForm({super.key});

  @override
  _OgretmenFormState createState() => _OgretmenFormState();
}

class _OgretmenFormState extends ConsumerState<OgretmenForm> {
  final Map<String, dynamic> girilen = {};
  final _formKey = GlobalKey<FormState>();

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Ad"),
                ),
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return "Ad girmeniz gerekli!";
                  }
                },
                onSaved: (newValue) {
                  girilen["ad"] = newValue;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Soyad"),
                ),
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Soyad girmeniz gerekli!";
                  }
                },
                onSaved: (newValue) {
                  girilen["soyad"] = newValue;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Yaş"),
                ),
                validator: (value) {
                  if (value?.isEmpty == true || value == null) {
                    return "Yaş girmeniz gerekli!";
                  }
                  if (int.tryParse(value) == null) {
                    "Rakamlarla yaş girmeniz gerekli!";
                  }
                },
                onSaved: (newValue) {
                  girilen["yas"] = int.parse(newValue!);
                },
              ),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: "Erkek",
                    child: Text("Erkek"),
                  ),
                  DropdownMenuItem(
                    value: "Kadın",
                    child: Text("Kadın"),
                  ),
                ],
                value: girilen["cinsiyet"],
                onChanged: (value) {
                  setState(() {
                    girilen["cinsiyet"] = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Lütfen cinsiyet seçin";
                  }
                },
              ),
              isSaving ? const CircularProgressIndicator() : ElevatedButton(
                  onPressed: () {
                    final formState = _formKey.currentState;
                    if(formState == null) return;
                    if(formState.validate() == true ){
                      formState.save();
                        print(girilen);
                    }
                    _kaydet();
                  },
                  child:  const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _kaydet() async {
    bool bitti =false;
    while(!bitti){
      try {
        setState(() {
          isSaving = true;
        });
        await gercektenKaydet();
        bitti = true;
        Navigator.of(context).pop(true);
      } catch (e) {
        final snackbar = ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())),);
        await snackbar.closed;
      }
      finally {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  int i=0;
  Future<void> gercektenKaydet() async {
    i++;
    if(i<3){
      throw "hata yakalandı";
    }
     await ref.read(dataServiceProvider).ogretmenEkle(Ogretmen.fromMap(girilen)
      );
  }
}

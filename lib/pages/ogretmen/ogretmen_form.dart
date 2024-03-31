import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/services/data_service.dart';

import '../../models/ogretmen.dart';


class OgretmenForm extends ConsumerStatefulWidget {
  const OgretmenForm({super.key});

  @override
  _OgretmenFormState createState() => _OgretmenFormState();
}

class _OgretmenFormState extends ConsumerState<OgretmenForm>
with SingleTickerProviderStateMixin{
  
  late final AnimationController controller = AnimationController(vsync: this);
  final  alignmentTween = Tween<AlignmentGeometry>(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight
  );

  final Map<String, dynamic> girilen = {};
  final _formKey = GlobalKey<FormState>();

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                    scale: controller,
                    child: const Icon(Icons.person,size: 200,),
                ),
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
                    label: Text
                      ("Yaş"),
                  ),
                  validator: (value) {
                    if (value?.isNotEmpty != true || value == null) {
                      return "Yaş girmeniz gerekli!";
                    }
                    if (int.tryParse(value) == null) {
                      "Rakamlarla yaş girmeniz gerekli!";
                    }
                  },
                  onSaved: (newValue) {
                    girilen["yas"] = int.parse(newValue!);
                  },
                  keyboardType: TextInputType.number,
                  // hatayı böyle önleyebildim yoksa ınvalid number hatası veriyordu
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (String value) {
                    if (value.isNotEmpty && int.tryParse(value) != null) {
                      final v = double.parse(value);
                      controller.animateTo(
                        v / 100,
                        duration: const Duration(seconds: 1),
                      );
                    }
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
                isSaving 
                    ? const CircularProgressIndicator() 
                    : AlignTransition(
                      alignment: alignmentTween.animate(controller),
                      child: ElevatedButton(
                      onPressed: () {
                        final formState = _formKey.currentState;
                        if(formState == null) return;
                        if(formState.validate() == true ){
                          formState.save();
                          print(girilen);
                        }
                        _kaydet();
                      },
                      child:  const Text("Kaydet")),
                    )
              ],
            ),
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


  Future<void> gercektenKaydet() async {
    await ref.read(dataServiceProvider).ogretmenEkle(Ogretmen.fromMap(girilen)
    );
  }
}

// ignore_for_file: unrelated_type_equality_checks

import 'dart:math';

import 'package:bilgi_yarismasi/const.dart';

import 'package:bilgi_yarismasi/test_veri.dart';
import 'package:flutter/material.dart';

class BilgiYarismasi extends StatefulWidget {
  const BilgiYarismasi({super.key});

  @override
  State<BilgiYarismasi> createState() => _BilgiYarismasiState();
}

class _BilgiYarismasiState extends State<BilgiYarismasi> {
  List<Widget> secimler = [];
  TestVeri test_1 = TestVeri();

  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("BRAVO TESTİ BİTİRDİNİZ! "),
            //content: const Text("hadi başa dön"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test_1.testiSifirla();
                    secimler = [];
                  });
                },
                child: const Text("BAŞA DÖN"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        test_1.getSoruYaniti() == secilenButon
            ? secimler.add(kDogruIconu)
            : secimler.add(kYanlisIconu);

        test_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  test_1.getSoruMetni(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 3,
              spacing: 3,
              children: secimler),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(12),
                        ),
                        onPressed: () {
                          butonFonksiyonu(false);
                        },
                        child: const Icon(
                          Icons.thumb_down,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.all(12),
                        ),
                        onPressed: () {
                          butonFonksiyonu(true);
                        },
                        child: const Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

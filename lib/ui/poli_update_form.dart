import 'package:flutter/material.dart';
import '../model/poli.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({super.key, required this.poli});

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _namaPoliCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaPoliCtrl.text = widget.poli.namaPoli;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaPoliCtrl,
              decoration: const InputDecoration(labelText: "Nama Poli"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.poli.namaPoli = _namaPoliCtrl.text;
                Navigator.pop(context, widget.poli);
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}

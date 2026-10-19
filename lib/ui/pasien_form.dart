import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _idCtrl = TextEditingController();
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void dispose() {
    _idCtrl.dispose();
    _nomorRmCtrl.dispose();
    _namaCtrl.dispose();
    _tanggalLahirCtrl.dispose();
    _nomorTeleponCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  InputDecoration _input(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Pasien",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFE3F2FD),
              child: Icon(Icons.person_add, size: 40, color: Color(0xFF1976D2)),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _idCtrl,
              keyboardType: TextInputType.number,
              decoration: _input("ID", Icons.badge_outlined),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _nomorRmCtrl,
              decoration: _input("Nomor RM", Icons.assignment_ind_outlined),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _namaCtrl,
              decoration: _input("Nama", Icons.person_outline),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _tanggalLahirCtrl,
              decoration: _input(
                "Tanggal Lahir",
                Icons.calendar_month_outlined,
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _nomorTeleponCtrl,
              keyboardType: TextInputType.phone,
              decoration: _input("Nomor Telepon", Icons.phone_outlined),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _alamatCtrl,
              maxLines: 3,
              decoration: _input("Alamat", Icons.location_on_outlined),
            ),
            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  final pasien = Pasien(
                    id: int.parse(_idCtrl.text),
                    nomorRm: _nomorRmCtrl.text,
                    nama: _namaCtrl.text,
                    tanggalLahir: _tanggalLahirCtrl.text,
                    nomorTelepon: _nomorTeleponCtrl.text,
                    alamat: _alamatCtrl.text,
                  );

                  Navigator.pop(context, pasien);
                },
                icon: const Icon(Icons.save),
                label: const Text("Simpan Pasien"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

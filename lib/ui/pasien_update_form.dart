import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  late TextEditingController _idCtrl;
  late TextEditingController _nomorRmCtrl;
  late TextEditingController _namaCtrl;
  late TextEditingController _tanggalLahirCtrl;
  late TextEditingController _nomorTeleponCtrl;
  late TextEditingController _alamatCtrl;

  @override
  void initState() {
    super.initState();

    _idCtrl = TextEditingController(text: widget.pasien.id.toString());
    _nomorRmCtrl = TextEditingController(text: widget.pasien.nomorRm);
    _namaCtrl = TextEditingController(text: widget.pasien.nama);
    _tanggalLahirCtrl = TextEditingController(text: widget.pasien.tanggalLahir);
    _nomorTeleponCtrl = TextEditingController(text: widget.pasien.nomorTelepon);
    _alamatCtrl = TextEditingController(text: widget.pasien.alamat);
  }

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
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Pasien",
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
              child: Icon(Icons.edit, size: 38, color: Color(0xFF1976D2)),
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
                  widget.pasien.id = int.parse(_idCtrl.text);
                  widget.pasien.nomorRm = _nomorRmCtrl.text;
                  widget.pasien.nama = _namaCtrl.text;
                  widget.pasien.tanggalLahir = _tanggalLahirCtrl.text;
                  widget.pasien.nomorTelepon = _nomorTeleponCtrl.text;
                  widget.pasien.alamat = _alamatCtrl.text;

                  Navigator.pop(context, widget.pasien);
                },
                icon: const Icon(Icons.save),
                label: const Text("Simpan Perubahan"),
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

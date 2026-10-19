import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  late TextEditingController _idCtrl;
  late TextEditingController _nipCtrl;
  late TextEditingController _namaCtrl;
  late TextEditingController _tanggalLahirCtrl;
  late TextEditingController _nomorTeleponCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;

  @override
  void initState() {
    super.initState();

    _idCtrl = TextEditingController(text: widget.pegawai.id.toString());
    _nipCtrl = TextEditingController(text: widget.pegawai.nip);
    _namaCtrl = TextEditingController(text: widget.pegawai.nama);
    _tanggalLahirCtrl = TextEditingController(
      text: widget.pegawai.tanggalLahir,
    );
    _nomorTeleponCtrl = TextEditingController(
      text: widget.pegawai.nomorTelepon,
    );
    _emailCtrl = TextEditingController(text: widget.pegawai.email);
    _passwordCtrl = TextEditingController(text: widget.pegawai.password);
  }

  @override
  void dispose() {
    _idCtrl.dispose();
    _nipCtrl.dispose();
    _namaCtrl.dispose();
    _tanggalLahirCtrl.dispose();
    _nomorTeleponCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
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
          "Edit Pegawai",
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
              controller: _nipCtrl,
              decoration: _input("NIP", Icons.credit_card_outlined),
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
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: _input("Email", Icons.email_outlined),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _passwordCtrl,
              obscureText: true,
              decoration: _input("Password", Icons.lock_outline),
            ),
            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  widget.pegawai.id = int.parse(_idCtrl.text);
                  widget.pegawai.nip = _nipCtrl.text;
                  widget.pegawai.nama = _namaCtrl.text;
                  widget.pegawai.tanggalLahir = _tanggalLahirCtrl.text;
                  widget.pegawai.nomorTelepon = _nomorTeleponCtrl.text;
                  widget.pegawai.email = _emailCtrl.text;
                  widget.pegawai.password = _passwordCtrl.text;

                  Navigator.pop(context, widget.pegawai);
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

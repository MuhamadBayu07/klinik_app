import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _idCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

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
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Pegawai",
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
              child: Icon(
                Icons.person_add,
                size: 40,
                color: Color(0xFF1976D2),
              ),
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
              decoration: _input(
                "Nomor Telepon",
                Icons.phone_outlined,
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: _input(
                "Email",
                Icons.email_outlined,
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _passwordCtrl,
              obscureText: true,
              decoration: _input(
                "Password",
                Icons.lock_outline,
              ),
            ),
            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  final pegawai = Pegawai(
                    id: int.parse(_idCtrl.text),
                    nip: _nipCtrl.text,
                    nama: _namaCtrl.text,
                    tanggalLahir: _tanggalLahirCtrl.text,
                    nomorTelepon: _nomorTeleponCtrl.text,
                    email: _emailCtrl.text,
                    password: _passwordCtrl.text,
                  );

                  Navigator.pop(context, pegawai);
                },
                icon: const Icon(Icons.save),
                label: const Text("Simpan Pegawai"),
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
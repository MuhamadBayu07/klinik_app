import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';
import 'pasien_form.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  final List<Pasien> daftarPasien = [
    Pasien(
      id: 1,
      nomorRm: "RM001",
      nama: "Dina",
      tanggalLahir: "10-01-2000",
      nomorTelepon: "081234567892",
      alamat: "Karawang",
    ),
    Pasien(
      id: 2,
      nomorRm: "RM002",
      nama: "Rina",
      tanggalLahir: "20-02-2000",
      nomorTelepon: "081234567893",
      alamat: "Karawang",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Pasien",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PasienForm()),
          );

          if (hasil != null) {
            setState(() {
              daftarPasien.add(hasil);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Pasien"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarPasien.length,
        itemBuilder: (context, index) {
          final pasien = daftarPasien[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFE3F2FD),
                child: Icon(
                  Icons.person_outline,
                  color: Color(0xFF1976D2),
                  size: 30,
                ),
              ),
              title: Text(
                pasien.nama,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "No. RM: ${pasien.nomorRm}\n"
                  "${pasien.nomorTelepon}",
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color(0xFF1976D2),
              ),
              onTap: () async {
                final hasil = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasienDetail(pasien: pasien),
                  ),
                );

                if (hasil == true) {
                  setState(() {
                    daftarPasien.removeAt(index);
                  });
                } else if (hasil != null) {
                  setState(() {});
                }
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';
import 'pegawai_form.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  final List<Pegawai> daftarPegawai = [
    Pegawai(
      id: 1,
      nip: "P001",
      nama: "Budi",
      tanggalLahir: "01-01-2000",
      nomorTelepon: "081234567890",
      email: "budi@gmail.com",
      password: "123456",
    ),
    Pegawai(
      id: 2,
      nip: "P002",
      nama: "Andi",
      tanggalLahir: "02-02-2000",
      nomorTelepon: "081234567891",
      email: "andi@gmail.com",
      password: "123456",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Pegawai",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PegawaiForm()),
          );

          if (hasil != null) {
            setState(() {
              daftarPegawai.add(hasil);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Pegawai"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarPegawai.length,
        itemBuilder: (context, index) {
          final pegawai = daftarPegawai[index];

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
                child: Icon(Icons.person, color: Color(0xFF1976D2), size: 30),
              ),
              title: Text(
                pegawai.nama,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("NIP: ${pegawai.nip}\n${pegawai.email}"),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color(0xFF1976D2),
              ),
              onTap: () async {
                final hasil = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PegawaiDetail(pegawai: pegawai),
                  ),
                );

                if (hasil == true) {
                  setState(() {
                    daftarPegawai.removeAt(index);
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

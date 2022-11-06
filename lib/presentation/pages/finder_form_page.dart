import 'package:flutter/material.dart';
import 'package:temu_cari/shared/styles/colors.dart';

class FinderFormPage extends StatelessWidget {
  const FinderFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Penemuan'),
        backgroundColor: purple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Barang',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Lokasi penemuan',
              ),
            ),
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Nomor whatsapp yang bisa dihubungi',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('Tambah Foto (Opsionial)'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text('Submit'),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

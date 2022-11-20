import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temu_cari/domain/usecases/pick_image.dart';
import 'package:temu_cari/domain/usecases/upload_image.dart';

import '../../../domain/entities/find_report.dart';
import '../../../domain/usecases/push_find_report.dart';
import '../../../injection_container.dart';
import '../../../shared/routes.dart';
import '../../../shared/styles/colors.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/auth_bloc/auth_state.dart';
import '../../blocs/report_bloc/report_bloc.dart';
import '../../blocs/report_bloc/report_event.dart';

class FinderFormPage extends StatefulWidget {
  const FinderFormPage({super.key});

  @override
  State<FinderFormPage> createState() => _FinderFormPageState();
}

class _FinderFormPageState extends State<FinderFormPage> {
  final TextEditingController _textItemController = TextEditingController();
  final TextEditingController _textLocationController = TextEditingController();
  final TextEditingController _textPhoneController = TextEditingController();

  final authBloc = getIt<AuthBloc>();

  XFile? imagePicked;

  @override
  void dispose() {
    _textItemController.dispose();
    _textLocationController.dispose();
    _textPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: authBloc,
      listener: (context, state) => (state is Authenticated)
          ? null
          : Navigator.pushReplacementNamed(context, loginPage),
      builder: (context, state) => (state is Authenticated)
          ? Scaffold(
              appBar: AppBar(
                title: const Text('Formulir Penemuan'),
                backgroundColor: purple,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: _textItemController,
                        decoration: const InputDecoration(
                          hintText: 'Barang',
                        ),
                      ),
                      TextField(
                        controller: _textLocationController,
                        decoration: const InputDecoration(
                          hintText: 'Lokasi penemuan',
                        ),
                      ),
                      TextField(
                        controller: _textPhoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Nomor whatsapp (628123456789)',
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          final image = await pickImage(context, camera: true);
                          setState(() {
                            imagePicked = image;
                          });
                        },
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
                        height: 16,
                      ),
                      (imagePicked == null)
                          ? const SizedBox()
                          : AspectRatio(
                              aspectRatio: 1,
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.file(
                                  File(imagePicked!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final item = _textItemController.text;
                          final location = _textLocationController.text;
                          final phone = _textPhoneController.text;
                          String imageUrl = "";

                          if (imagePicked != null) {
                            imageUrl = await uploadImage(
                              File(
                                imagePicked!.path,
                              ),
                            );
                          }

                          if (item != "" && location != "" && phone != "") {
                            FindReport newReport = FindReport(
                              author: state.user.id,
                              location: location,
                              phone: phone,
                              item: item,
                              status: "process",
                              image: imageUrl,
                            );
                            final pushFindReport = getIt<PushFindReport>();
                            pushFindReport(newReport);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Laporan anda telah disimpan'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            getIt<ReportBloc>().add(GetReport(state.user.id));

                            Navigator.pushReplacementNamed(context, homePage);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Formulir tidak boleh kosong'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
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
                        ),
                      ),
                      const SizedBox(height: 64),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}

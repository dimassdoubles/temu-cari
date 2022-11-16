import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/seek_report.dart';
import '../../../domain/usecases/push_seek_report.dart';
import '../../../injection_container.dart';
import '../../../shared/routes.dart';
import '../../../shared/styles/colors.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/auth_bloc/auth_state.dart';
import '../../blocs/report_bloc/report_bloc.dart';
import '../../blocs/report_bloc/report_event.dart';

class SeekerFormPage extends StatefulWidget {
  const SeekerFormPage({super.key});

  @override
  State<SeekerFormPage> createState() => _SeekerFormPageState();
}

class _SeekerFormPageState extends State<SeekerFormPage> {
  final TextEditingController _textItemController = TextEditingController();
  final TextEditingController _textLocationController = TextEditingController();
  final TextEditingController _textCharacteristicController =
      TextEditingController();

  @override
  void dispose() {
    _textItemController.dispose();
    _textLocationController.dispose();
    _textCharacteristicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = getIt<AuthBloc>();
    return BlocConsumer(
      bloc: authBloc,
      listener: (context, state) => (state is Authenticated)
          ? null
          : Navigator.pushReplacementNamed(context, loginPage),
      builder: (context, state) => (state is Authenticated)
          ? Scaffold(
              appBar: AppBar(
                title: const Text('Formulir Pencarian'),
                backgroundColor: purple,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
                        hintText: 'Lokasi kehilangan',
                      ),
                    ),
                    TextField(
                      controller: _textCharacteristicController,
                      decoration: const InputDecoration(
                        hintText: 'Ciri-ciri barang',
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
                        onPressed: () {
                          final item = _textItemController.text;
                          final location = _textLocationController.text;
                          final characteristic =
                              _textCharacteristicController.text;

                          if (item != "" &&
                              location != "" &&
                              characteristic != "") {
                            SeekReport newReport = SeekReport(
                              author: state.user.id,
                              location: location,
                              characteristic: characteristic,
                              item: item,
                              status: "process",
                            );
                            final pushFindReport = getIt<PushSeekReport>();
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
                        )),
                  ],
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}

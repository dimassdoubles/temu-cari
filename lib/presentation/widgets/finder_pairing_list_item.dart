// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';

import '../../shared/styles/colors.dart';

class FinderPairingListItem extends StatefulWidget {
  FindReport report;
  SeekReport pairReport;
  FinderPairingListItem({
    required this.report,
    required this.pairReport,
    Key? key,
  }) : super(key: key);

  @override
  State<FinderPairingListItem> createState() => _FinderPairingListItemState();
}

class _FinderPairingListItemState extends State<FinderPairingListItem> {
  bool _optionOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 32, left: 32, bottom: 16),
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: const Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          ListTile(
            onTap: () {
              setState(() {
                _optionOn = false;
              });
            },
            title: Text(
              'Penemuan : ${widget.pairReport.item}',
              maxLines: 1,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/location.png',
                  width: 10,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(widget.pairReport.location),
              ],
            ),
            trailing: _optionOn
                ? const SizedBox(
                    width: 100,
                  )
                : IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: darkGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _optionOn = true;
                      });
                    },
                  ),
          ),
          _optionOn
              ? SizedBox(
                  height: 72,
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print("click tolak");
                            },
                            child: Container(
                              decoration: BoxDecoration(color: red),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'tolak',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print("click serahkan");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: green,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'serahkan',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

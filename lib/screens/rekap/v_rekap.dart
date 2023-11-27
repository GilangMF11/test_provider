import 'package:flutter/material.dart';
import 'package:provider_dzikir/utils/util_color.dart';

class RekapPage extends StatefulWidget {
  const RekapPage({super.key});

  @override
  State<RekapPage> createState() => _RekapPageState();
}

class _RekapPageState extends State<RekapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.primaryColor(),
        title: const Text("Rekap Bulan November Tahun 2023", style: TextStyle(
          fontSize: 12
        ),),
      ),
      body: Container(),
    );
  }
}
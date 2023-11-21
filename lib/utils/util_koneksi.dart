import 'dart:io';

class cekKoneksi {
  bool koneksi = false;

  cekKoneksi() {
    _cekKoneksi();
  }

  void _cekKoneksi() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        koneksi = true;
        print('connected');
      }
    } on SocketException catch (_) {
      koneksi = false;
      print('not connected');
    }
  }
}
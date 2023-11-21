import 'package:url_launcher/url_launcher.dart';

class LaunchBrowser {
  Future<void> _lauchBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},

    )){
      throw 'Could not launch $url';
    }
  }
}
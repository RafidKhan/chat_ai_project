import 'package:url_launcher/url_launcher.dart';

class UrlLauncher{
 static Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
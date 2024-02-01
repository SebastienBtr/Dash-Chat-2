import 'package:url_launcher/url_launcher.dart';

void openLink(String link) {
  launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
}

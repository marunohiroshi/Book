import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends ConsumerWidget {
  SettingsView({Key? key}) : super(key: key);

  final _urlLaunchWithUriButton = UrlLaunchWithUriButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('設定',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Terms Of Service'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.receipt),
                title: const Text('利用規約'),
                onPressed: (context) {},
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Licenses'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.format_list_bulleted_outlined),
                title: const Text('OSSライセンス一覧'),
                onPressed: (context) {},
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Contact Us'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.quick_contacts_mail),
                title: const Text('お問い合わせ'),
                onPressed: (context) {
                  _urlLaunchWithUriButton.launchUrlWithUri(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UrlLaunchWithUriButton {
  final Uri _flutterUrl = Uri.parse('https://twitter.com/3f6N4gMYgNkfiq6');
  final alertSnackBar = SnackBar(
    content: const Text('このURLは開けませんでした'),
    action: SnackBarAction(
      label: '戻る',
      onPressed: () {},
    ),
  );

  Future<void> launchUrlWithUri(BuildContext context) async {
    if (!await launchUrl(
      _flutterUrl,
    )) {
      alertSnackBar;
      ScaffoldMessenger.of(context).showSnackBar(alertSnackBar);
    }
  }
}

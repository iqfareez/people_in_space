import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAboutDialog extends StatelessWidget {
  const MyAboutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('About'),
      children: [
        const SimpleDialogOption(
          child: Text(
              'This app shows the number of people in space right now. It uses the Open Notify API with Bing Images to get the data.'),
        ),
        SimpleDialogOption(
          child: const Text('Made with Flutter by Muhammad Fareez'),
          onPressed: () => launchUrl(Uri.parse('https://iqfareez.com'),
              mode: LaunchMode.externalApplication),
        ),
        SimpleDialogOption(
          child: const Text('View source code on GitHub'),
          onPressed: () => launchUrl(
              Uri.parse('https://github.com/iqfareez/people_in_space'),
              mode: LaunchMode.externalApplication),
        ),
        if (!kIsWeb)
          SimpleDialogOption(
            child: const Text('Open on the web'),
            onPressed: () => launchUrl(
                Uri.parse('https://iqfareez.github.io/people_in_space'),
                mode: LaunchMode.externalApplication),
          ),
        if (kIsWeb)
          SimpleDialogOption(
            child: const Text('Download for Android'),
            onPressed: () => launchUrl(
                Uri.parse(
                    'https://play.google.com/store/apps/details?id=com.iqfareez.people_in_space'),
                mode: LaunchMode.externalApplication),
          ),
      ],
    );
  }
}

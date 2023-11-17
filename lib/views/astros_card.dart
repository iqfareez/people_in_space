import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Networking/astros_model.dart';
import 'image_viewer.dart';

class AstrosCard extends StatelessWidget {
  const AstrosCard({super.key, required this.people});

  final People people;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImageViewer(
                        imageSrc: people.thumbnailUrl!,
                        name: people.name!,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Hero(
                      tag: 'gambar-${people.name}',
                      child: Image.network(
                        people.thumbnailUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      people.name.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Craft: ',
                            style: TextStyle(fontWeight: FontWeight.w200),
                          ),
                          TextSpan(
                            text: people.craft,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                launchUrl(
                    Uri.https('www.google.com', 'search', {'q': people.name}),
                    mode: LaunchMode.externalApplication);
              },
              icon: const Icon(Icons.search, size: 18),
              label: const Text('Find out more...'),
            ),
          ],
        ),
      ),
    );
  }
}

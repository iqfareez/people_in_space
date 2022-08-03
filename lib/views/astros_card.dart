import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Networking/astros_model.dart';

class AstrosCard extends StatelessWidget {
  const AstrosCard({Key? key, required this.people}) : super(key: key);

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
                  onTap: () => showDialog(
                    context: context,
                    builder: (builder) => Dialog(
                      child: Image.network(people.thumbnailUrl!, loadingBuilder:
                          (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      people.thumbnailUrl!,
                      fit: BoxFit.cover,
                      // height: 120,
                      // width: 110,
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
            TextButton(
              onPressed: () {
                launchUrl(
                    Uri.https('www.google.com', 'search', {'q': people.name}),
                    mode: LaunchMode.externalApplication);
              },
              child: const Text('Find out more...'),
            ),
          ],
        ),
      ),
    );
  }
}

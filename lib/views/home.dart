import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Networking/astros_model.dart';
import '../Networking/fetch_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Future<BingImageResponse> _imageFuture;
  late Future<AstrosModel> _astrosFuture;
  @override
  void initState() {
    super.initState();
    _astrosFuture = FetchData.getAstros();
  }

  int crossAxisCount() {
    if (MediaQuery.of(context).size.width > 1200) {
      return 6;
    } else if (MediaQuery.of(context).size.width > 992) {
      return 5;
    } else if (MediaQuery.of(context).size.width > 768) {
      return 4;
    } else if (MediaQuery.of(context).size.width > 600) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/pexels-spacex-23793.jpg'),
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.6, sigmaY: 3.6),
                      child: Center(
                        child: FutureBuilder(
                          future: _astrosFuture,
                          builder:
                              (context, AsyncSnapshot<AstrosModel> snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                '${snapshot.data!.number} people in space',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 28),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FutureBuilder(
                  future: _astrosFuture,
                  builder: (context, AsyncSnapshot<AstrosModel> snapshot) {
                    if (snapshot.hasData) {
                      return GridView.extent(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        // crossAxisCount: crossAxisCount(),
                        childAspectRatio: 4 / 6,
                        maxCrossAxisExtent: 300,
                        children: snapshot.data!.people!
                            .map((e) => AstrosCard(people: e))
                            .toList(),
                      );
                    } else {
                      return const Center(
                        child: SingleChildScrollView(),
                      );
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Opacity(
                  opacity: 0.65,
                  child: Icon(
                    CupertinoIcons.rocket,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                launch(Uri.https('www.google.com', 'search', {'q': people.name})
                    .toString());
              },
              child: const Text('Find out more...'),
            ),
          ],
        ),
      ),
    );
  }
}

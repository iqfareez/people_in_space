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
    // _imageFuture = FetchData.getAstrosImage();
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
                        childAspectRatio: 4 / 5,
                        maxCrossAxisExtent: 300,
                        children: snapshot.data!.people!
                            .map((e) => Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () => showDialog(
                                            context: context,
                                            builder: (builder) => Dialog(
                                              child: Image.network(
                                                  e.thumbnailUrl!),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Image.network(
                                              e.thumbnailUrl!,
                                              fit: BoxFit.cover,
                                              height: 80,
                                              width: 90,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.name.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 2),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    const TextSpan(
                                                        text: 'Craft: ',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black38)),
                                                    TextSpan(
                                                      text: e.craft,
                                                      style: const TextStyle(
                                                          color: Colors.black45,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(flex: 2),
                                        TextButton(
                                          onPressed: () {
                                            launch(Uri.https(
                                                'www.google.com',
                                                'search',
                                                {'q': e.name}).toString());
                                          },
                                          child: const Text('Find out more...'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
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
                child: Icon(
                  CupertinoIcons.rocket,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

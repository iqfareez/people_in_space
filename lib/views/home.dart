import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:people_in_space/Networking/astros_model.dart';
import 'package:people_in_space/Networking/bing_search_model.dart';
import 'package:people_in_space/Networking/fetch_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Future<BingImageResponse> _imageFuture;
  late Future<AstrosModel> _astrosFuture;
  late AstrosModel _astrosList;
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
                    decoration: BoxDecoration(
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
                              _astrosList = snapshot.data!;
                              print('_astrosList is $_astrosList');
                              return Text(
                                '${snapshot.data!.number} peoples in space',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              );
                            } else
                              return CircularProgressIndicator();
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
                      return GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: crossAxisCount(),
                        children: snapshot.data!.people!
                            .map((e) => Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StatefulBuilder(
                                            builder: (context, setWidgetState) {
                                          return FutureBuilder(
                                              future: FetchData.getAstrosImage(
                                                  e.name!),
                                              builder: (context,
                                                  AsyncSnapshot<
                                                          BingImageResponse>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  return TextButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (builder) =>
                                                              Dialog(
                                                                child: Image.network(
                                                                    snapshot
                                                                        .data!
                                                                        .value!
                                                                        .first!
                                                                        .thumbnailUrl!),
                                                              ));
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: Image.network(
                                                        snapshot
                                                            .data!
                                                            .value!
                                                            .first!
                                                            .thumbnailUrl!,
                                                        fit: BoxFit.cover,
                                                        height: 80,
                                                        width: 90,
                                                      ),
                                                    ),
                                                  );
                                                } else if (snapshot
                                                        .connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const LinearProgressIndicator();
                                                } else {
                                                  return TextButton(
                                                      onPressed: () {
                                                        setWidgetState(() {});
                                                      },
                                                      child: Container(
                                                        height: 80,
                                                        width: 90,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade100,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .image_not_supported_rounded,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                        ),
                                                      ));
                                                }
                                              });
                                        }),
                                        Spacer(),
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
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 2),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: 'Craft: ',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black38)),
                                                    TextSpan(
                                                      text: e.craft,
                                                      style: TextStyle(
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
                                        Spacer(
                                          flex: 2,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            launch(Uri.https(
                                                'www.google.com',
                                                'search',
                                                {'q': e.name}).toString());
                                          },
                                          child: Text('Find out more...'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(
                        child: SingleChildScrollView(),
                      );
                    }
                  },
                ),
              ),
              Padding(
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

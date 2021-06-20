import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:people_in_space/Networking/astros_model.dart';
import 'package:people_in_space/Networking/bing_search_model.dart';
import 'package:people_in_space/Networking/fetch_data.dart';
import 'package:url_launcher/link.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<BingImageResponse> _imageFuture;
  late Future<AstrosModel> _astrosFuture;
  late AstrosModel _astrosList;
  @override
  void initState() {
    super.initState();
    _imageFuture = FetchData.getAstrosImage();
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
                        shrinkWrap: true,
                        crossAxisCount: crossAxisCount(),
                        children: snapshot.data!.people!
                            .map((e) => Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Text(e.name.toString()),
                                        subtitle: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(text: 'craft: '),
                                              TextSpan(
                                                text: e.craft,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Link(
                                          uri: Uri.https('www.google.com',
                                              'search', {'q': 'maple kacak'}),
                                          target: LinkTarget.defaultTarget,
                                          builder: (ctx, openLink) {
                                            return TextButton(
                                              onPressed: openLink,
                                              child:
                                                  Text('Find more on web...'),
                                            );
                                          },
                                        ),
                                      )
                                    ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

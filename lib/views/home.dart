import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Networking/astros_model.dart';
import '../Networking/fetch_data.dart';
import 'astros_card.dart';
import 'my_about_dialog.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
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
                        image: AssetImage(
                            'assets/tartila-freepik-space-pattern.jpg'),
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
              Padding(
                padding: const EdgeInsets.all(12),
                child: Opacity(
                  opacity: 0.65,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => const MyAboutDialog(),
                      );
                    },
                    icon: const Icon(CupertinoIcons.rocket),
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

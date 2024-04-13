import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Networking/astros_model.dart';
import '../Networking/fetch_data.dart';
import 'astros_card.dart';
import 'my_about_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
                    child: Center(
                      child: FutureBuilder(
                        future: _astrosFuture,
                        builder:
                            (context, AsyncSnapshot<AstrosModel> snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              // why ignore? Sebab bila buat interpolation, vscode takleh
                              // properly format syntax
                              // ignore: prefer_interpolation_to_compose_strings
                              '${snapshot.data!.number}' +
                                  switch (snapshot.data!.number) {
                                    1 => ' people in space',
                                    _ => ' peoples in space',
                                  },
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FutureBuilder(
                  future: _astrosFuture,
                  builder: (context, AsyncSnapshot<AstrosModel> snapshot) {
                    if (snapshot.hasData) {
                      return SelectionArea(
                        child: GridView.extent(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // crossAxisCount: crossAxisCount(),
                          childAspectRatio: 4 / 5,
                          maxCrossAxisExtent: 300,
                          children: snapshot.data!.people!
                              .map((e) => AstrosCard(people: e))
                              .toList(),
                        ),
                      );
                    } else {
                      return GridView.extent(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        // crossAxisCount: crossAxisCount(),
                        childAspectRatio: 4 / 5,
                        maxCrossAxisExtent: 300,
                        children: [
                          for (int i = 0; i < 6; i++) const _LoaderShimmer()
                        ],
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

/// Widget to show when data is laoding, we try to make the design (padding, size etc) same
/// as AstroCard
class _LoaderShimmer extends StatelessWidget {
  const _LoaderShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Shimmer.fromColors(
        baseColor: switch (Theme.of(context).brightness) {
          Brightness.light => Colors.grey[300]!,
          Brightness.dark => Colors.grey[800]!,
        },
        highlightColor: switch (Theme.of(context).brightness) {
          Brightness.light => Colors.white,
          Brightness.dark => Colors.grey,
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300],
          ),
          // height: 100,
          // width: 100,
        ),
      ),
    );
  }
}

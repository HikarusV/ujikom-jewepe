import 'package:flutter/material.dart';
import 'package:jewepe/data/model/article.dart';
import 'package:jewepe/presentation/widget/poster_card.dart';

import '../../main.dart';

class MadingPages extends StatelessWidget {
  const MadingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20374B),
      body: Stack(
        children: [
          Positioned(
              child: IconButton(
                  onPressed: () {
                    handler.userInit('', '');
                  },
                  icon: Icon(Icons.add))),
          Container(
            padding: const EdgeInsets.all(40),
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                // crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisExtent: MediaQuery.of(context).size.width / 2.5,
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 2.5,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                // mainAxisSpacing: 60,
                // crossAxisSpacing: 60,
              ),
              children: [
                PosterCard(
                  keys: 'poster1',
                  article: Article(
                    createdAt: DateTime.now(),
                  ),
                ),
                PosterCard(
                  keys: 'poster2',
                  article: Article(
                    createdAt: DateTime.now(),
                  ),
                ),
                PosterCard(
                  keys: 'poster3',
                  article: Article(
                    createdAt: DateTime.now(),
                  ),
                ),
                PosterCard(
                  keys: 'poster4',
                  article: Article(
                    createdAt: DateTime.now(),
                  ),
                ),
                PosterCard(
                  keys: 'poster5',
                  article: Article(
                    createdAt: DateTime.now(),
                  ),
                ),
                PosterCard(
                  keys: 'poster1',
                  article: Article(
                    createdAt: DateTime.now(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
